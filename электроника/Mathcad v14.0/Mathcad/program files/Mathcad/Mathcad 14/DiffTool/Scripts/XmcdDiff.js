///////////////////////////////////////////////////////////////////////////
// This file contains javascript code that implements  client-side Diff
// functionality.
//
// The two diff panes have to be named diff_source and diff_target in order
// for this code to work correctly.
//
// The region ids' suffix of 'source' or 'target' determines which
// pane the region is a part of.
//
// The global array variable regionList contains the regions as they occur
// in the documents. This array is populated on the server
// (see XmcdDiff.XmcdDiffModel.cs), and contains all the Source regions,
// interspersed with Target regions that do not exist in the source (added
// regions). The idea is that if a region shows up in both Source and
// Target (Unchanged and Changed regions only - Removed regions
// will occur only in the Source and Added will show up only in the Target)
// then only the Source region is stored in the list, since it is easy to
// figure out the div id of the corresponding target region by replacing
// the 'source' suffix with 'target'
//
///////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////
// GLOBAL METHODS AND VARIABLES
///////////////////////////////////////////////////////////////////////////
var DpiXMultiplier = 1;          //ratio for calculating the left position based on the DPI of the client
var DpiYMultiplier = 1;          //ratio for calculating the top position based on the DPI of the client

var sourcePane = null;           // An instance of the DiffPane class representing the source document
var targetPane = null;           // An instance of the DiffPane class representing the target document

var currentDiffPosition = -1;    //Used for Next/Previous positioning (indexes into regionList, 0-based)
var currentSourceRegionPosition = -1;   // 1-based
var currentTargetRegionPosition = -1;   // 1-based

var verticalMidpoint = 0;        // The vertical midpoint of the panes. Set during Initialization

var nextButtonLink = null;       //The link contained within the Next button. Global variable so it is set only once.
var previousButtonLink = null;   //The link contained within the Previous button. Global variable so it is set only once.

var defaultZoom = 75;            //Default zoom %
var curZoom = defaultZoom;
var displayFullSizeAtZoomLevel = 90;   //The zoom percentage at which individual regions display full size on mouseover
var minZoom = 1;

// REVIEW mjl 6/4/2007 - These are used in SetPaneHeights() to fix bug#070309-171910
// which was caused when the wrapping of the filename (when the window width was
// resized smaller) caused the calculated height of the targetPane to become
// negative. This prevents the really bad crash behaviour, but is still not
// really well behaved.
var minContentHeight = 200;
var minDocHeight = 100;

var sourceRegionIndicator = null;
var targetRegionIndicator = null;

var timeoutId = null;

var zoomValueObject = null;

window.onresize = SetPaneHeights;
document.onclick = UnhighlightTitles;


function GetPaneHeight()
{
   var paneHeight = 800;
   var paneHeightElement = document.getElementById( 'paneHeight' );
   if ( paneHeightElement != null )
   {
      paneHeight = parseInt( paneHeightElement['value'] );
   }

   return paneHeight;
}

///////////////////////////////////////////////////////////////////////////
// SetDpiMultiplier() is called once on loading the page. This helps
// calculate the dpi setting of the client and adjust the style.top &
// style.left attributes of the region divs.
///////////////////////////////////////////////////////////////////////////
function SetDpiMultiplier()
{
   // no documents yet!
   if ( sourcePane == null || sourcePane._transformContent == null || sourcePane._transformContent.children == null )
   {
      return;
   }

   var region = sourcePane._transformContent.children[1];
   // this means we have empty documents!
   if ( region == null )
   {
      document.getElementById( 'diff_source' ).style.height = GetPaneHeight() + "px";
      document.getElementById( 'diff_target' ).style.height = GetPaneHeight() + "px";

      ShowZoomSlider();
      return;
   }

   var pixels = region.style.pixelTop;
   var points = region.style.posTop;
   DpiYMultiplier = pixels / points;

   pixels = region.style.pixelLeft;
   points = region.style.posLeft;
   DpiXMultiplier = pixels / points;
}

function ShowZoomSlider()
{
   var zoomSlider = document.getElementById( "zoomSlider" );
   var s = new Slider( zoomSlider,  document.getElementById( "zoomSliderInput" ) );

   zoomValueObject = document.getElementById( "zoomValue" );
   zoomValueObject.innerText = curZoom + "%";

   s.setMaximum( 100 );
   s.setMinimum( minZoom );
   s.setValue( curZoom );

   s.onchange = function() { SliderMoved( s.getValue() ); };

   if ( sourcePane )
   {
      //show slider
      document.getElementById( 'zoomControl' ).style.display = '';

      SetZoom();
   }
}

///////////////////////////////////////////////////////////////////////////
// Sets up the synchronization between the sourcePane and the targetPane
///////////////////////////////////////////////////////////////////////////
function SyncStart()
{
   // this indicates that the files have not been loaded yet
   if ( regionList == null )
      return;

   if ( sourcePane == null )
   {
      Initialize();
      SetDpiMultiplier();
   }
   else
   {
      sourcePane.AddScrollSync( targetPane );
      targetPane.AddScrollSync( sourcePane );
   }
}

///////////////////////////////////////////////////////////////////////////
// Called only the first time SyncStart is invoked.
// Sets a number of global variables
///////////////////////////////////////////////////////////////////////////
function Initialize()
{
   sourcePane = new DiffPane( 'diff_source' );
   targetPane = new DiffPane( 'diff_target' );

   // check whether there is any content in the source/target panes...
   if ( sourcePane._transformContent == null || targetPane._transformContent == null )
   {
      return;
   }

   SetPaneHeights();
   verticalMidpoint = GetPaneHeight() / 2;

   if ( sourcePane._divContainer.children != null && sourcePane._divContainer.children.length > 0 )
   {
      curZoom = parseFloat( sourcePane._divContainer.children[0].style.zoom );
   }
   else
   {
      curZoom = defaultZoom;
   }
   if ( isNaN( curZoom ) )
   {
      curZoom = defaultZoom;
   }

   ShowZoomSlider();

   SetupCurrentDiffIndicators();
   ShowNextDiff();

   document.getElementById( "next_previous" ).style.display = '';
}

function GetCurrentSourceRegion()
{
   return GetSourceRegion( currentSourceRegionPosition );
}

function GetSourceRegion( index )
{
   var ans = null;
   var sourceRegions = sourcePane._transformContent.childNodes;
   if ( index > 0 && index < sourceRegions.length )
   {
      ans = sourceRegions[index];
      if ( ans.id == 'indicator_source' )
      {
         ans = null;
      }
   }

   return ans;
}

function GetCurrentTargetRegion()
{
   return GetTargetRegion( currentTargetRegionPosition );
}

function GetTargetRegion( index )
{
   var ans = null;
   var targetRegions = targetPane._transformContent.childNodes;
   if ( index > 0 && index < targetRegions.length )
   {
      ans = targetRegions[index];
      if ( ans.id == 'indicator_target' )
      {
         ans = null;
      }
   }

   return ans;
}

function GetTargetRegionIndex( region )
{
   return GetRegionIndex( targetPane, region );
}

function GetSourceRegionIndex( region )
{
   return GetRegionIndex( sourcePane, region );
}

// finds the index of a region in the pane
function GetRegionIndex( pane, region )
{
   var index;
   var regionCount = pane._transformContent.childNodes.length - 1
   for ( index = 1; index < regionCount; index++ )
   {
      if ( region.id == pane._transformContent.childNodes[index].id )
      {
         return index;
      }
   }

   return -1;
}

// finds the index of a diff region in the region list
function GetRegionDiffIndex( region )
{
   // is it a source region?
   if ( region.id.substr( region.id.length - 6 ) == 'source' )
   {
      var index = GetSourceRegionIndex( region );
      if ( index < 0 )
      {
         return -1;
      }
      var diffIndex;
      for ( diffIndex = 0; diffIndex < regionList.length; diffIndex++ )
      {
         if ( regionList[diffIndex][0] == index )
         {
            return diffIndex;
         }
      }
   }
   else
   {
      var index = GetTargetRegionIndex( region );
      if ( index < 0 )
      {
         return -1;
      }
      var diffIndex;
      for ( diffIndex = 0; diffIndex < regionList.length; diffIndex++ )
      {
         if ( regionList[diffIndex][1] == index )
         {
            return diffIndex;
         }
      }
   }

   return -1;
}


function SetupCurrentDiffIndicators()
{
   var indicatorImage = new Image( 14, 14 );
   indicatorImage.src = currentDir + '/scripts/i/pointer-orange-14.gif';

   sourceRegionIndicator = CreateIndicatorElementWithImage( 'source', indicatorImage );
   // sourceRegionIndicator = CreateIndicatorElement('source');
   var sourceTransformContent = sourcePane._transformContent;
   sourceTransformContent.appendChild( sourceRegionIndicator );

   targetRegionIndicator = CreateIndicatorElementWithImage( 'target', indicatorImage );
   // targetRegionIndicator = CreateIndicatorElement('target');
   var targetTransformContent = targetPane._transformContent;
   targetTransformContent.appendChild( targetRegionIndicator );
}

function CreateIndicatorElement( suffix )
{
   var indicator = document.createElement( 'div' );

   indicator.setAttribute( 'id', 'indicator_' + suffix );
   indicator.innerText = '>';

   indicator.className = 'DiffIndicator';
   indicator.style.backgroundImage = 'url(' + currentDir + '/scripts/i/red-i.gif)';
   // indicator.style.borderStyle = 'solid';
   // indicator.style.borderWidth = '1.5pt';
   // indicator.style.borderColor = 'black';
   // indicator.style.backgroundColor = 'white';

   // indicator.style.position = 'absolute';
   // indicator.style.height = '14px';
   // indicator.style.width = '14px';
   // indicator.style.zIndex = 2;
   // indicator.style.display = 'none';

   return indicator;
}

function CreateIndicatorElementWithImage( suffix, img )
{
   var indicator = document.createElement( 'div' );

   indicator.setAttribute( 'id', 'indicator_' + suffix );
   indicator.style.position = 'absolute';
   indicator.style.height = img.height + 'px';
   indicator.style.width = img.width + 'px';
   indicator.style.zIndex = 2;
   indicator.style.display = 'none';

   var imgTag = document.createElement( 'img' );
   imgTag.setAttribute( 'src', img.src );

   indicator.appendChild( imgTag );

   return indicator;
}

function GetChildWithId( element, childId )
{
   if ( element.id == childId )
      return element;

   var children = element.getElementsByTagName( "div" );
   for ( i = 0; i < children.length; i++ )
   {
      if ( children[i].id == childId )
         return children[i];
   }

   return null;
}

function SliderMoved( sliderValue )
{
   if ( sliderValue < minZoom )
      sliderValue = minZoom;

   curZoom = sliderValue;
   zoomValueObject.innerText = curZoom + "%";

   CallTimeout( "SetZoom()" );
}

function CallTimeout( functionName, timeout )
{
   if ( timeoutId )
      clearTimeout( timeoutId );

   if ( !timeout )
      timeout = 1;

   timeoutId = setTimeout( functionName, timeout );
}

function ShowFullSize( region, showFlag )
{
   if ( !region )
      return;

   var otherRegion = document.getElementById( SwitchSourceTarget( region.id ) );

   ShowFullSizeDiv( region, showFlag );
   ShowFullSizeDiv( otherRegion, showFlag );
}

function ShowFullSizeDiv( region, showFlag )
{
   if ( !region )
      return;

   if ( showFlag )
   {
      region.style.zoom = 100 * (100 / curZoom) + '%';
      region.style.zIndex = 3;
      if ( !region.style.backgroundColor )
      {
         region.style.backgroundColor = '#FFFFFF';
      }
   }
   else
   {
      region.style.zoom = '100%';
      region.style.zIndex = 1;
   }

   //Adjust scroll position if needed
   AdjustScrollPosition( region );
}

function AdjustScrollPosition( region )
{
   var parentPane = region.parentElement.parentElement;
   var paneBottom = parseFloat( parentPane.scrollTop ) + parseFloat( parentPane.clientHeight );

   var regionBottom = GetRegionScrollTop( region, 1 );

   if ( paneBottom < regionBottom )
   {
      parentPane.scrollTop += (regionBottom - paneBottom) * DpiYMultiplier;
   }

   var regionLeft = GetRegionScrollLeft( region );
   var regionRight = regionLeft + (parseFloat( region.style.width ) * DpiXMultiplier);

   var paneLeft = parseFloat( parentPane.scrollLeft );
   var paneRight = paneLeft + parseFloat( parentPane.clientWidth );

   var leftDelta = regionLeft - paneLeft;

   if ( paneRight < regionRight )
   { // right side is hidden
      var delta = regionRight - paneRight;

      if ( delta > leftDelta )
      {
         delta = leftDelta;
      }

      parentPane.scrollLeft += delta;
   }
   if ( paneLeft > regionLeft )
   {
      parentPane.scrollLeft += leftDelta;
   }
}

function SetZoom()
{
   zoomString = curZoom + '%';
   sourcePane._divContainer.children[0].style.zoom = zoomString;
   targetPane._divContainer.children[0].style.zoom = zoomString;

   IndicateCurrentDiff();
   UpdateDiffBorders();
}

function ShowUpdatingMessage( flag )
{
   document.getElementById( 'dialogCtl_m_Textlbl' ).style.textAlign = 'center';
   document.getElementById( 'dialogCtl_m_Textlbl' ).innerText = 'Updating...';
   document.getElementById( 'buttonbar' ).style.display = 'none';
   dialogCtl_floatingDiv.setVisible( flag );
}

// JK: do we want to do this?
function UpdateDiffBorders()
{
   // changeBorderWidth = 2 * (100 / curZoom) + 'pt';

   // for(i = 0; i < regionObjectList.length; i++)
   // {
   //    if(regionObjectList[i][2] == 'change') {
   //       var region = regionObjectList[i][0];
   //       if(region && region.className != "")
   //          region.style.borderWidth = changeBorderWidth;

   //       region = regionObjectList[i][1];
   //       if(region && region.className != "")
   //          region.style.borderWidth = changeBorderWidth;
   //    }
   // }
}



///////////////////////////////////////////////////////////////////////////
// Called only the first time SyncStart is invoked.
// Sets a number of global variables
///////////////////////////////////////////////////////////////////////////
function SetPaneHeights()
{
   var contentPane = document.getElementById( 'content_pane' );

   if ( content_pane == null )
   {
      return;
   }

   var actualPaneHeight = GetPaneHeight() - contentPane.offsetTop;
   if ( actualPaneHeight < minContentHeight )
      actualPaneHeight = minContentHeight;
   contentPane.style.height = actualPaneHeight + "px";

   if ( sourcePane != null )
   {
      actualHeight = GetPaneHeight() - sourcePane._divContainer.offsetTop;
      if ( actualHeight < minDocHeight )
         actualHeight = minDocHeight;
      sourcePane._divContainer.style.height = actualHeight + "px";
   }

   if ( targetPane != null )
   {
      actualHeight = GetPaneHeight() - targetPane._divContainer.offsetTop;
      if ( actualHeight < minDocHeight )
         actualHeight = minDocHeight;
      targetPane._divContainer.style.height = actualHeight + "px";
   }
}

///////////////////////////////////////////////////////////////////////////
// Returns the height of the ContentSectionEnd & ContentBodyEnd tables so
// the pages' height can be set correctly to cover the window's height
///////////////////////////////////////////////////////////////////////////
function GetFooterHeight()
{
   var height = 0;
   var footer = document.getElementById( 'ContentSectionEnd' );
   if ( footer != null )
      height = footer.offsetHeight;

   footer = document.getElementById( 'ContentBodyEnd' );
   if ( footer != null )
      height += footer.offsetHeight;

   footer = document.getElementById( 'DiffLegend' );
   if ( footer != null )
      height += footer.offsetHeight;

   return height;
}

///////////////////////////////////////////////////////////////////////////
//Removes the synchronization between the sourcePane and the targetPane
///////////////////////////////////////////////////////////////////////////
function SyncStop()
{
   sourcePane.RemoveScrollSync( targetPane );
   targetPane.RemoveScrollSync( sourcePane );
}

///////////////////////////////////////////////////////////////////////////
// This method needs to be global because there is no simple way to call
// this from within setTimeOut. This is actually called from either
// sourcePane or targetPane
///////////////////////////////////////////////////////////////////////////
function ScrollSync( srcElementId )
{
   var srcElement = document.getElementById( srcElementId );

   var pane = srcElementId == 'diff_source' ? sourcePane : targetPane;
   pane.SyncOtherPane();
}

///////////////////////////////////////////////////////////////////////////
//returns the value that the panes' scrollTop should be set to in order for the 'region' to be
//displayed at the top of the pane
///////////////////////////////////////////////////////////////////////////
function GetRegionScrollTop(region, direction)
{
   var scrollTop = parseFloat( region.style.top ) * DpiYMultiplier;

   //when scrolling down, use the region's bottom edge
   scrollTop += direction == 1 ? region.scrollHeight : 0;

   return scrollTop * (curZoom / 100);
}

///////////////////////////////////////////////////////////////////////////
//returns the value that the panes' scrollLeft should be set to in order for the 'region' to be
//displayed at the left of the pane
///////////////////////////////////////////////////////////////////////////
function GetRegionScrollLeft( region )
{
   var scrollLeft = parseFloat( region.style.left ) * DpiXMultiplier;

   return scrollLeft * (curZoom / 100);
}

///////////////////////////////////////////////////////////////////////////
//if srcString is '*source', returns '*target'
//returns '*source' otherwise
///////////////////////////////////////////////////////////////////////////
function SwitchSourceTarget( srcString )
{
   var replaced = srcString.substr( srcString.length - 6 ); //'source' and 'target' are both 6 characters long
   var replaceWith = replaced == 'source' ? 'target' : 'source';

   return srcString.replace( replaced, replaceWith );
}

///////////////////////////////////////////////////////////////////////////
// Called when the mouse is over a diff region.
// See Resources\MCXmlToDiffXhtml.xslt
///////////////////////////////////////////////////////////////////////////
function HandleMouseOver( region )
{
   if ( region.contains( window.event.fromElement ) )
      return;

   HighlightRegion( region, true );
   if ( curZoom < displayFullSizeAtZoomLevel )
   {
      ShowFullSizeDiv( region, true );
   }
}

///////////////////////////////////////////////////////////////////////////
// Called when the mouse leaves a diff region.
// See Resources\MCXmlToDiffXhtml.xslt
///////////////////////////////////////////////////////////////////////////
function HandleMouseOut( region )
{
   if ( region.contains( window.event.toElement ) )
      return;

   HighlightRegion( region, false );
}

///////////////////////////////////////////////////////////////////////////
// Highlights a diff region - currently happens when the onmouseover event
// fires, and when the Next/Previous buttons are clicked.
//
///////////////////////////////////////////////////////////////////////////
function HighlightRegion( region, showFlag )
{
   if ( region == null )
      return;

   //find corresponding region if it exists
   var otherRegion = document.getElementById( SwitchSourceTarget( region.id ) );

   HighlightDiv( region, showFlag );
   HighlightDiv( otherRegion, showFlag );

   if ( curZoom < displayFullSizeAtZoomLevel )
   {
      ShowFullSize( region, showFlag );
   }

   if ( showFlag )
   {
      if ( IsSourceRegion( region.id ) )
      {
         sourcePane._currentHightlightedRegion = region;
      }
      else
      {
         targetPane._currentHightlightedRegion = region;
      }
   }
}

function HighlightDiv( div, showFlag )
{
   //highlight div only if it exists and it is a diffregion
   if ( div == null || div.getAttribute( 'diffregion' == null ) )
   {
      return;
   }

   if ( showFlag )
   {
      div.style.borderStyle = 'solid';
      //        div.style.filter = 'alpha(opacity=100)';
   }
   else
   {
      div.style.borderStyle = 'dashed';
      //        div.style.filter = 'alpha(opacity=75)';
   }
}

function UnhighlightCurrentRegions()
{
   HighlightRegion( sourcePane._currentHightlightedRegion, false );
   HighlightRegion( targetPane._currentHightlightedRegion, false );
}

function IndicateCurrentDiff()
{
   if ( currentDiffPosition > -1 && currentDiffPosition < regionList.length )
   {
      var sourceRegionObject = GetSourceRegion( regionList[currentDiffPosition][0] );
      var targetRegionObject = GetTargetRegion( regionList[currentDiffPosition][1] );
      ShowCurrentDiffIndicator( sourceRegionIndicator, sourceRegionObject );
      ShowCurrentDiffIndicator( targetRegionIndicator, targetRegionObject );
   }
}

function ShowCurrentDiffIndicator( regionIndicator, region )
{
   //if(!region || region.className == '') {
   if ( !region )
   {
      regionIndicator.style.display = 'none';
      return;
   }

   regionIndicator.style.zoom = 100 * (100 / curZoom) + '%';

   // place the indicator on TOP
   // regionIndicator.style.top = parseFloat(region.style.top) - (parseFloat(regionIndicator.style.height) / DpiYMultiplier * 100 / curZoom) + 3 + 'pt'; //GetRegionScrollTop(region) - parseFloat(regionIndicator.style.height);
   // regionIndicator.style.left = parseFloat(region.style.left) + 3 + 'pt';

   // place the indicator on the LEFT
   // 1.5 is the width of the indicator border
   // 14 is the width of the indicator
   // 3 is the fudge factor
   regionIndicator.style.top = (parseFloat( region.style.top ) + 1.5) + 'pt';
   // regionIndicator.style.left = parseFloat(region.style.left) - parseFloat(regionIndicator.style.width) + 'pt';
   regionIndicator.style.left = (parseFloat( region.style.left ) - (14 / DpiYMultiplier * 100 / curZoom)) + 3 + 'pt';
   regionIndicator.style.display = 'block';
}

//called when the "Previous" button is clicked
function ShowPreviousDiff()
{
   if ( currentDiffPosition >= 0 )
   {
      ScrollToDiffRegion( -1 );
   }
}

//called when the "Next" button is clicked
function ShowNextDiff()
{
   if ( currentDiffPosition < regionList.length - 1 )
   {
      ScrollToDiffRegion( +1 );
   }
}

function IsSourceRegion( regionId )
{
   return IsRegionInPane( regionId, 'source' );
}

function IsTargetRegion( regionId )
{
   return IsRegionInPane( regionId, 'target' );
}

function IsRegionInPane( regionId, pane )
{
   return regionId.substr( regionId.length - pane.length ) == pane;
}


function HandleMouseClick( region )
{
   SetCurrentDiffRegion( region );
}

// sets the current region as a diff region
function SetCurrentDiffRegion( region )
{
   // NOTE: this is the region

   var diffIndex = GetRegionDiffIndex( region );
   if ( diffIndex < 0 )
   {
      return;
   }
   currentDiffPosition = diffIndex;

   SyncStop();
   IndicateCurrentDiff();
   SetupNextPreviousButtons();
   CallTimeout( "SyncStart()" );

}

//scrolls both panes to the next or previous diff depending on the value of 'direction'
//direction=1 : goto next diff
//direction=-1: goto previous diff
function ScrollToDiffRegion( direction )
{
   currentDiffPosition += direction;

   var regionPair = GetCurrentDiffRegions();

   sourceRegion = regionPair[0];
   targetRegion = regionPair[1];

   SyncStop();

   ScrollPaneToRegion( sourceRegion, sourcePane, direction );
   ScrollPaneToRegion( targetRegion, targetPane, direction );

   // TODO:
   // if(!sourceRegion)
   //    ScrollToNearestValidRegion(sourcePane, direction);

   // if(!targetRegion)
   //    ScrollToNearestValidRegion(targetPane, direction);

   IndicateCurrentDiff();

   SetupNextPreviousButtons();

   CallTimeout( "SyncStart()" );
}

function ScrollPaneToRegion( region, pane, direction )
{
   if ( region )
   {
      var scrollDiv = pane._divContainer;

      scrollDiv.scrollTop = GetRegionScrollTop( region, direction ) - verticalMidpoint;
      SetHorizontalScrollPosition( region, scrollDiv );
   }
}

function SetHorizontalScrollPosition( region, scrollDiv )
{
   var regionLeft = region.offsetLeft * (curZoom / 100);
   var regionWidth = region.offsetWidth * (curZoom / 100);

   if ( regionLeft + regionWidth > scrollDiv.scrollLeft + scrollDiv.offsetWidth || regionLeft < scrollDiv.scrollLeft )
      scrollDiv.scrollLeft = GetRegionScrollLeft( region );
}

// TODO: revise
function ScrollToNearestValidRegion( pane, direction )
{
   var targetDiffPosition = currentDiffPosition;
   var targetRegion, sourceRegion;

   while ( targetDiffPosition + direction >= 0 && targetDiffPosition + direction < regionObjectList.length )
   {
      targetDiffPosition += direction;

      sourceRegion = regionObjectList[targetDiffPosition][0];
      targetRegion = regionObjectList[targetDiffPosition][1];

      if ( sourceRegion && targetRegion )
         break;
   }

   if ( sourceRegion && targetRegion )
   {
      if ( pane._otherPane )
      {
         var offsetDistance = GetOffsetDistance( pane._otherPane._divContainer, sourceRegion, targetRegion );

         pane._divContainer.scrollTop = offsetDistance;
      }
   }
}

function GetOffsetDistance( pane, sourceRegion, targetRegion )
{
   var paneId = pane.id;

   //if the region is not in the pane, switch
   if ( !IsRegionInPane( sourceRegion.id, paneId.substr( paneId.length - 6 ) ) )
   {
      var region = targetRegion;
      targetRegion = sourceRegion;
      sourceRegion = region;
   }

   return GetRegionScrollTop( targetRegion ) - (GetRegionScrollTop( sourceRegion ) - pane.scrollTop);
}

//returns the next or previous region that is either changed, added or removed
function GetCurrentDiffRegions()
{
   currentSourceRegionPosition = regionList[currentDiffPosition][0];
   currentTargetRegionPosition = regionList[currentDiffPosition][1];
   var sourceRegionObject = GetSourceRegion( currentSourceRegionPosition );
   var targetRegionObject = GetSourceRegion( currentTargetRegionPosition );
   return new Array( sourceRegionObject, targetRegionObject, regionList[currentDiffPosition][2] );
}

function IsChangedRegion( region )
{
   return ( region[2] == 'change' )
}

function SetupNextPreviousButtons()
{
   GetPreviousButtonLink().disabled = currentDiffPosition <= 0;
   GetNextButtonLink().disabled = currentDiffPosition >= regionList.length - 1;
}

function GetPreviousButtonLink()
{
   if ( previousButtonLink != null )
      return previousButtonLink;

   previousButtonLink = GetButtonLink( '_btnDiffPrevious' );
   return previousButtonLink;
}

function GetNextButtonLink()
{
   if ( nextButtonLink != null )
      return nextButtonLink;

   nextButtonLink = GetButtonLink( '_btnDiffNext' );
   return nextButtonLink;
}

function GetButtonLink( buttonId )
{
   var button = document.getElementById( buttonId );
   if ( button == null )
      return null;

   // TODO: this should never happen...
   var links = button.getElementsByTagName( "button" );
   if ( links.length > 0 )
      return links[0];
}

function UnhighlightTitles()
{
   // document.getElementById('diff_source').previousSibling.className = 'DiffTitle';
   // document.getElementById('diff_target').previousSibling.className = 'DiffTitle';
}

function SetPaneFocus( pane )
{
   // document.getElementById(SwitchSourceTarget(pane.id)).previousSibling.className = 'DiffTitle';
   // pane.previousSibling.className = 'DiffTitleFocused';
}

///////////////////////////////////////////////////////////////////////////
// CONSTRUCTOR: DiffPane
// DESCRIPTION:
//   Creates an object that acts as one of the scrollable panes for XmcdDiff
// PARAMETERS:
//   suffix - either 'source' or 'target' - this should correspond to two divs
//    on the page named 'diff_source and diff_target
///////////////////////////////////////////////////////////////////////////
function DiffPane( name )
{
   this._divContainer = document.getElementById( name );
   this._transformContent = GetChildWithId( this._divContainer, 'TransformContent' );

   if ( this._divContainer == null )
   {
      alert( 'DiffPane constructor: No div named ' + name + ' found' );
   }
   else
   {
      this._divContainer.style.height = GetPaneHeight() + "px";
   }

   this._currentPosition = 0;
   this._scrollDirection = 1;
   this._currentHightlightedRegion = null;

   // An alias for "this" for use with "private" methods
   var self = this;

   ///////////////////////////////////////////////////////////////////////
   // PUBLIC METHODS
   ///////////////////////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////////////////////
   // METHOD: AddScrollSync
   // DESCRIPTION:
   //   Sets the scroll event handlers
   // PARAMETERS:
   //   otherPane - the other DiffPane object to sync with
   // RETURNS:
   //   None
   ///////////////////////////////////////////////////////////////////////
   this.AddScrollSync = function( otherPane )
   {
      this.RemoveScrollSync();

      this._otherPane = otherPane;
      this._syncScroll = getOnScrollFunction();
      this._wheelSyncScroll = getWheelScrollFunction();

      this._otherPane._divContainer.attachEvent( "onscroll", self._syncScroll );
      this._otherPane._divContainer.attachEvent( "onmousewheel", self._wheelSyncScroll );
   }

   this.RemoveScrollSync = function()
   {
      if ( this._otherPane != null )
      {
         this._otherPane._divContainer.detachEvent( "onscroll", this._syncScroll );
         this._otherPane._divContainer.detachEvent( "onmousewheel", this._wheelSyncScroll );
      }

      //this._otherPane = null;;
      this._syncScroll = null;
      this._wheelSyncScroll = null;
   }

   ///////////////////////////////////////////////////////////////////////
   // Synchronizes the other pane to match this
   ///////////////////////////////////////////////////////////////////////
   this.SyncOtherPane = function()
   {
      var scrollTopForOtherPane = getScrollTopForOtherPane();
      var targetElement = this._otherPane._divContainer;

      if ( scrollTopForOtherPane != -1 )
      {
         targetElement.scrollTop = scrollTopForOtherPane;
      }

      targetElement.scrollLeft = this._divContainer.scrollLeft;
      this._currentPosition = this.GetScrollTop();
      this._otherPane._currentPosition = this._otherPane.GetScrollTop();

      CallTimeout( "SyncStart()" );
      SetupNextPreviousButtons();

      // TODO: not sure that we want to do this -- it used to set the indicator to the visible change
      //    if(regionObjectList[currentRegionPosition][2] == "change") {
      //       currentDiffPosition = currentRegionPosition;
      //       IndicateCurrentDiff(regionObjectList[currentDiffPosition]);
      //    }
   }

   ///////////////////////////////////////////////////////////////////////////
   //returns the value that the panes' scrollTop should be set to in order for the 'region' to be
   //displayed at the top of the pane
   ///////////////////////////////////////////////////////////////////////////
   this.GetRegionScrollTop = function( region )
   {
      var scrollTop = parseFloat( region.style.top ) * DpiYMultiplier;

      //when scrolling down, use the region's bottom edge
      //scrollTop += this._scrollDirection == 1 ? region.scrollHeight : 0;
      //scrollTop += region.scrollHeight;

      return scrollTop * (curZoom / 100);
   }

   this.GetScrollTop = function()
   {
      return this._divContainer.scrollTop ;
   }

   this.getTopVisibleRegionIndex = function()
   {
      var regionCount = self._transformContent.childNodes.length - 1; // note: diff indicator i sadded to the list
      if ( self.GetScrollTop() > self._currentPosition )
      {
         self._scrollDirection = 1; //scrolling down
         for ( i = 1; i < regionCount; i++ )
         {
            if ( isValidRegion( i ) )
            {
               break;
            }
         }
      }
      else
      {
         self._scrollDirection = -1;   //scrolling up
         for ( i = regionCount - 1; i > 0; i-- )
         {
            if ( isValidRegion( i ) )
            {
               break;
            }
         }
      }

      // no valid region found
      if ( i <= 0 || i >= regionCount )
         return -1;

      return i;
   }

   this._divContainer.onclick = function()
   {
      SetPaneFocus( this );
      event.cancelBubble = true;
      return false;
   }

   this._divContainer.onfocusin = function()
   {
      SetPaneFocus( this );
      this.focus();
   }

   ///////////////////////////////////////////////////////////////////////
   // PRIVATE METHODS
   ///////////////////////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////////////////////
   // METHOD: getOnScrollFunction
   // DESCRIPTION:
   // Returns the anonymous function handler that gets called when a scroll
   // event happens
   // PARAMETERS:
   // None
   // RETURNS:
   // The anonynmous function handler for the scroll event
   ///////////////////////////////////////////////////////////////////////
   function getOnScrollFunction()
   {
      return function()
      {
         SyncStop();

         //need this for scrolling to work correctly when the user
         //clicks on the scrollbar rather than dragging
         CallTimeout( "ScrollSync('" + event.srcElement.id + "')" );
      };
   }

   function getWheelScrollFunction()
   {
      return function()
      {
         SyncStop();

         //onmousewheel event does not always return the parent diff_source or diff_target div, but whatever
         //div the mouse is currently on. So need to recursively look for the correct parent div.
         if ( event.srcElement == null )
            return;

         var srcElement = getParentDiffDiv( event.srcElement, SwitchSourceTarget( self._divContainer.id ) );

         if ( srcElement != null )
            CallTimeout( "ScrollSync('" + srcElement.id + "')" );
         else
         {
            CallTimeout( "SyncStart()" );
         }
      };
   }

   ///////////////////////////////////////////////////////////////////////
   // METHOD: attachScrollEvents
   // DESCRIPTION:
   // Attaches the scroll events and the corresponding handlers to the
   // actual div elements
   // PARAMETERS:
   // this Pane
   // RETURNS:
   // None
   ///////////////////////////////////////////////////////////////////////
   function attachScrollEvents( thisPane )
   {
      if ( thisPane._otherPane == null )
      {
         alert( 'attachScrollEvents(): _otherPane not set' );
         return;
      }

      thisPane._divContainer.attachEvent( "onscroll", thisPane._otherPane._syncScroll );
      thisPane._divContainer.attachEvent( "onmousewheel", thisPane._otherPane._wheelSyncScroll );
   }

   ///////////////////////////////////////////////////////////////////////
   // METHOD: detachScrollEvents
   // DESCRIPTION:
   //  Detaches the scroll events on the div elements
   // PARAMETERS:
   //  None
   // RETURNS:
   // None
   ///////////////////////////////////////////////////////////////////////
   function detachScrollEvents( thisPane )
   {
      if ( thisPane.otherPane == null )
      {
         return;
      }

      thisPane._divContainer.detachEvent( "onscroll", thisPane.otherPane._syncScroll );
      thisPane._divContainer.detachEvent( "onmousewheel", thisPane.otherPane._wheelSyncScroll );
   }

   ///////////////////////////////////////////////////////////////////////
   // METHOD: getParentDiffDiv
   // DESCRIPTION:
   //  Recursively looks for a parent of oElement with id = parentDivId
   // currentPosition
   // PARAMETERS:
   //  None
   // RETURNS:
   // scrollTop value for the other pane
   ///////////////////////////////////////////////////////////////////////
   function getParentDiffDiv( oElement, parentDivId )
   {
      if ( oElement.id == parentDivId )
         return oElement;

      var parentElement = oElement.parentElement;
      if ( parentElement == null )
         return null;

      if ( parentElement.id == parentDivId )
         return parentElement;

      return getParentDiffDiv( parentElement, parentDivId );
   }

   ///////////////////////////////////////////////////////////////////////
   // METHOD: getScrollTopForOtherPane
   // DESCRIPTION:
   //  Returns the scrollTop value for the other pane based on this pane's
   // currentPosition
   // PARAMETERS:
   //  None
   // RETURNS:
   // scrollTop value for the other pane
   ///////////////////////////////////////////////////////////////////////
   function getScrollTopForOtherPane()
   {
      var regionIndex = self.getTopVisibleRegionIndex();
      //        var otherRegionIndex = self._otherPane.getTopVisibleRegionIndex();

      var region;

      if ( self._divContainer.id == 'diff_target' )
      {
         region = GetTargetRegion( regionIndex );
         //       otherRegion = GetSourceRegion(otherRegionIndex);
      }
      else
      {
         region = GetSourceRegion( regionIndex );
         //       otherRegion = GetTargetRegion(otherRegionIndex);
      }

      if ( region == null )
      {
         return -1;
      }

      var otherRegion = document.getElementById( SwitchSourceTarget( region.id ) );

      if ( otherRegion == null )
      {
         return -1;
      }

      // TODO: make sure that the regions are exactly aligned
      var regionPosition =                 self.GetRegionScrollTop( region )      - verticalMidpoint -      region.scrollHeight * (curZoom / 100) * 0;
      var otherRegionPosition = self._otherPane.GetRegionScrollTop( otherRegion ) - verticalMidpoint - otherRegion.scrollHeight * (curZoom / 100) * 0;

      return self.GetScrollTop() - (regionPosition - otherRegionPosition);
      //        return otherRegionPosition;
   }

   // this is more like 'isVisibleRegion()'
   function isValidRegion( index )
   {
      var region;

      if ( self._divContainer.id == 'diff_source' )
      {
         region = GetSourceRegion( index );
      }
      else
      {
         region = GetTargetRegion( index );
      }

      if ( region == null )
         return false;

      var scrollTop = self.GetRegionScrollTop( region ) - self.GetScrollTop() - verticalMidpoint;

      if ( scrollTop * self._scrollDirection >= 0 )
      {
         self._currentPosition = scrollTop;
         return true;
      }

      return false;
   }
}

///////////////////////////////////////////////////////////////////////////
// Debug methods
///////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////
// ShowDebug - Adds a div with id debugTxt at (10, 820) on the screen if
// one doesn't already exist. Concatenates msg and ', ' to the contents of
// this div.  Right-clicking on the div will clear the text.
// Used for debugging.
///////////////////////////////////////////////////////////////////////////
function ShowDebug( msg )
{
   var debugTxt = getDebugTxtDiv();

   if ( debugTxt )
   {
      if ( !debugTxt.firstChild )
      {
         var txtMsg = document.createTextNode( msg + ", " );
         debugTxt.appendChild( txtMsg );
      }
      else
         debugTxt.firstChild.nodeValue += msg + ", ";
   }
}

function getDebugTxtDiv()
{
   var debugTxt = document.getElementById( 'debugTxt' );

   if ( debugTxt )
      return debugTxt;

   debugTxt = document.createElement( 'div' );

   debugTxt.setAttribute( 'id', 'debugTxt' );
   debugTxt.style.position = 'absolute';
   debugTxt.style.top = '820px';
   debugTxt.style.left = '10px';
   debugTxt.style.width = '80%';
   debugTxt.style.border = 'solid 1px black';
   debugTxt.style.backgroundColor = 'lightgreen';

   //on right-click, clear out debugTxt
   debugTxt.oncontextmenu =
         function()
   {
      document.getElementById( 'debugTxt' ).firstChild.nodeValue = '';
      return false;
   }

   debugTxt.title = 'Right-click to clear';

   var parentElement = document.getElementById( 'DiffLegend' );
   parentElement.appendChild( debugTxt );

   return debugTxt;
}

///////////////////////////////////////////////////////////////////////////
// End Debug methods
///////////////////////////////////////////////////////////////////////////
