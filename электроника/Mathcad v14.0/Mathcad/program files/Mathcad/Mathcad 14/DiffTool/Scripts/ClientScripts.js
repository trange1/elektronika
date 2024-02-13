var ns4=document.layers;
var ns6=document.getElementById&&!document.all;
var ie5=document.all;

var updatableBtnList = Array();	//Command bar buttons that can be enabled or disabled based on items selected
var checkedItems;	// list of items that are checked.

// Function to attach event handler
function AttachEventHandler(target,eventName,handlerName)
{
	if ( target.addEventListener )
	{
		if(eventName.substr(0,2).toLowerCase()=="on")
			eventName = eventName.substr(2,eventName.length-2);
		target.addEventListener(eventName, handlerName, false);
	}
	else if ( target.attachEvent )
	{ 
		if(eventName.substr(0,2).toLowerCase()!="on")
			eventName = "on" + eventName;
		target.attachEvent(eventName, handlerName);
	}
	else
	{ 
		if(eventName.substr(0,2).toLowerCase()!="on")
			eventName = "on" + eventName;
		var handle;
		handle.oldHandler = target.eventName;
		handle.eventName = function()
		{
			if(handle.oldHandler)
			{
				handle.oldHandler();
			}
			handlerName();
		}
		target.eventName = handle.eventName;
	} 
}

// Function to attach event handler to window.onload event
function AttachToWindowOnLoad(functionName)
{
	AttachEventHandler(window,"onload",functionName);
}

function ShowDialog(DlgName, Mode, strArgs){
	var q;
	if(DlgName){q="dlg="+DlgName;} 
	if(Mode){q+="&mode=" + Mode;} 
	if(strArgs){q+="&args="+strArgs;}
	q=(window.encodeURI ? encodeURI(q) : escape(q))
	window.location="DialogManager.aspx?"+q
}

function NewWindow(url, name, w, h, LeftPosition, TopPosition, bFull){
	if (!LeftPosition){LeftPosition=(screen.width)?(screen.width-w)/2:100;}
	if (!TopPosition){TopPosition=(screen.height)?(screen.height-h)/2:100;}
	var buff = "";
	if(w){buff="width="+w+",";}
	if(h){buff+="height="+h+",";}	
	if (bFull){settings=buff;
	}else{
		if(LeftPosition){{buff+="left="+LeftPosition+",";}}
		if(TopPosition){{buff+="top="+TopPosition+",";}}
		settings=buff+'scrollbars=no,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes';
	}
	return window.open(url,name,settings);
}

function HighlighRow(oTR, sStyle){
	//i'm expecting obj to be a table data (TR) element
	//we need to update the entire row so get all th TDs and update them
	//var oTR = obj.parentNode;
	for (var i = 0; i < oTR.childNodes.length; i++){
		if (oTR.childNodes[i].tagName == "TD"){
			oTR.childNodes[i].className = sStyle;
		}
	}
}
		
function LowlightRow(oTR, sStyle){
	//i'm expecting obj to be a table data (TR) element
	//we need to update the entire row so get all th TDs and update them
	//var oTR = obj.parentNode;
	for (var i = 0; i < oTR.childNodes.length; i++){
		if (oTR.childNodes[i].tagName == "TD"){
			oTR.childNodes[i].className = sStyle;
		}
	}	
}
		
var oMenu = null;
var sCurrentExt = null;
var oSelectedItem = null;
selectMenuItems = '';

function ShowMenu(sMenu, root) {
	
	DisplayMenuItems(true);
	
	if (oMenu){oMenu.style.visibility = "hidden";}
	if (oSubMenu){oSubMenu.style.visibility = "hidden";}
	oMenu = document.all[sMenu]
	
	if(root){
		oMenu.style.pixelLeft = getPos(root, "Left")
		oMenu.style.pixelTop = getPos(root, "Top") + root.offsetHeight
	}else{
	
	    if(document.documentElement.clientWidth <  document.body.scrollLeft + oMenu.offsetWidth + event.clientX)
	    {
	       
	       oMenu.style.left = oMenu.offsetParent.scrollLeft + event.clientX - oMenu.offsetWidth;
	    }
	    else
	    {
	         oMenu.style.left = oMenu.offsetParent.scrollLeft + event.clientX;
	    }
	    if(document.documentElement.clientHeight < document.body.scrollTop + oMenu.clientHeight + event.clientY)
	    {
	        oMenu.style.top = oMenu.offsetParent.scrollTop + event.clientY - oMenu.clientHeight;
	    }
	    else
	    {
	        oMenu.style.top = oMenu.offsetParent.scrollTop + event.clientY;
	    }
	
	}
	event.cancelBubble = true;
	oMenu.style.visibility = "visible";
	document.onclick = HideMenu;
	return false;
}

var oSubMenu = null;
function ShowSubMenu(sMenu, root){
	if (oSubMenu){oSubMenu.style.visibility = "hidden";}
	oSubMenu = document.all[sMenu]
		
	oSubMenu.style.pixelLeft = getPos(root, "Left") + root.offsetWidth
	oSubMenu.style.pixelTop = getPos(root, "Top")
	oSubMenu.style.visibility = "visible";

	if (selectMenuItems != null){
		document.getElementById('lnkBtnCopyLHS').style.display = (selectMenuItems == 'ShowAll' || selectMenuItems == 'ShowLHS') ? '' : 'none';
		document.getElementById('lnkBtnCopyRHS').style.display = (selectMenuItems == 'ShowAll') ? '' : 'none';
	}
}
                             
function HideSubMenu(menuItem){
	if (oSubMenu && (!menuItem ||!oSubMenu.contains(menuItem)))
	{
	  oSubMenu.style.visibility = "hidden";
	}
}
				
function HideMenu() {
	document.onclick = ""
	if (oMenu){
		oMenu.style.visibility = "hidden";
		DisplayMenuItems(false);
	}		
	HideSubMenu();
}

function addcolltoarr( arr, coll )
{
	if ( coll != null )
	{
		for( var idx = 0; idx < coll.length; ++idx )
			arr[ arr.length ] = coll[ idx ];
	}
}

function DisplayMenuItems(bDisplay)
{
	var items = new Array();
	addcolltoarr( items, document.all["any"] );
	//figure out which menu items to display
	addcolltoarr( items, document.all[sCurrentExt] );		
	//if it's xmcd we also want to display the mcd menu item
	if(sCurrentExt == "xmcd")
	{
		addcolltoarr( items, document.all['mcd'] );		
	}		
	for(var i=0; i<items.length; i++)
	{
		if (bDisplay)
			DisplayMenuItem( items[i], oSelectedItem );
		else
			items[i].style.display = 'none';
	}	
}

function DisplayMenuItem( menuItem, selectedItem )
{
	var disp = '';		
	if ( menuItem.attributes[ "onupdateui" ] != null )
	{		
		var isVisible = eval( menuItem.attributes[ "onupdateui" ].nodeValue + "(menuItem, selectedItem)" );
		if ( !isVisible )
			disp = 'none';
	}
	menuItem.style.display = disp;
}
		
function getPos(el,sProp) {
	var iPos = 0
	while (el!=null) {
		iPos+=el["offset" + sProp]
		el = el.offsetParent
	}
	return iPos
}

function docontext(obj, smenu, val, menuItems){
	oSelectedItem = obj;
	//hide any existing menus
	HideMenu()
	
	if (val){
		document.forms(0).__act.value = val
	}else{		
		document.forms(0).__act.value = obj.ItemID;
		document.forms(0).__ver.value = obj.ver ? obj.ver : -1;
	}
	
	//save the extension of the selected file
	if (menuItems == null){		
		//ObjectTypes 1 = file, 128 = container, 129 = folder, 130 = binder, 131 = portfolio
		if (obj.ObjectType != 129 && obj.ObjectType != 130 && obj.ObjectType != 131){		
			var t = obj.FileName;		
			sCurrentExt = (t.substring(t.lastIndexOf(".")+1)).toLowerCase();
			if (sCurrentExt == "xmcdz" || sCurrentExt == "xmct"){
				sCurrentExt = "xmcd";
			}
			
			// Make sure that if it is an xmcd, that it is supported
			if( sCurrentExt == "xmcd" )
			{
				var ns = obj.RootNamespace;
				var nsFound = false;
				for(var i =0; i < SupportedMathcadNamespaces.length; i++)
				{
					var supported = SupportedMathcadNamespaces[i];
					if(supported == ns)
					{
						nsFound = true;
						break;
					}				
				}
				
				if(!nsFound) {sCurrentExt = ""};			
			}
		}else{
			sCurrentExt = "container";
		}
	}
	else
	{
		var bDisplay = false;
		if(menuItems.substr(0,6)=="Result")
		{
			bDisplay = true;
			menuItems = menuItems.substring(6);
		}
		var all = document.all["provReport"]
		if(all)
		{
			for(var i=0; i<all.length; i++){all[i].style.display = (bDisplay==true?'':'none');}
		}
	}

	selectMenuItems = menuItems;

	ShowMenu(smenu)		
}		
		
function ToggleVer(Aobj){
	var obj = Aobj.parentElement.nextSibling	
	if (obj.style.display == "none"){
		obj.style.display = ''
		Aobj.innerText = "[-]"
	}
	else{
		obj.style.display = "none"
		Aobj.innerText = "[+]"
		}	
}

function IsMathcadClientInstalled()
{
    try
    {
        objEditor = new ActiveXObject("MCLauncher.Launcher");
        if(objEditor == null)
			return false;
		else
			return true;
    }
    catch (e)
    {
        return false;
    }
}

function EditMathcadDocument(strDocument){
    try
    {
        objEditor = new ActiveXObject("MCLauncher.Launcher");
    }
    catch (e)
    {
        alert(EditDocumentErrorMessage);
        return;
    }
    window.onfocus = null;
    try
    {
        if (!objEditor.CreateNewDocument(strDocument,""))
			alert(EditDocumentErrorMessage);
        return;
    }
    catch(e)
    {
		alert(EditDocumentErrorMessage);
		return;
    }
}

function ConfirmDelete(){
	return confirm(DeleteConfirmMessage + " " + getSelectedFileName() + "?");
}
function getSelectedFileName(){
	var strDocument = document.forms(0).__act.value;
	if (!strDocument){return null;}
	strDocument = strDocument.substring(1, strDocument.indexOf(":"));
	return strDocument.substring(strDocument.lastIndexOf("/")+1);
}
function getRefToDivMod( divID, oDoc ) {
	if( !oDoc ) { oDoc = document; }
	if( document.layers ) {
		if( oDoc.layers[divID] ) { return oDoc.layers[divID]; } else {
			for( var x = 0, y; !y && x < oDoc.layers.length; x++ ) {
				y = getRefToDivNest(divID,oDoc.layers[x].document); }
			return y; } }
	if( document.getElementById ) { return oDoc.getElementById(divID); }
	if( document.all ) { return oDoc.all[divID]; }
	return document[divID];
}
function resizeWinTo(idOfDiv, diff) {
	var oH = getRefToDivMod( idOfDiv ); if( !oH ) { return false; }
	var oW = oH.clip ? oH.clip.width : oH.offsetWidth;
	var oH = oH.clip ? oH.clip.height : oH.offsetHeight; if( !oH ) { return false; }
	var x = window; x.resizeTo( oW + 200, oH + 200 );
	var myW = 0, myH = 0, d = x.document.documentElement, b = x.document.body;
	if( x.innerWidth ) { myW = x.innerWidth; myH = x.innerHeight; }
	else if( d && d.clientWidth ) { myW = d.clientWidth; myH = d.clientHeight; }
	else if( b && b.clientWidth ) { myW = b.clientWidth; myH = b.clientHeight; }
	if( window.opera && !document.childNodes ) { myW += 16; }
	x.resizeTo( oW + ( ( oW + 200 ) - myW ), oH + ( (oH + 200 ) - myH ) );
}

function SelectItems (FieldName, Value, Items){
	var arritems, obj, count;
	if (Items){
		arritems = Items.split(",");
		count = arritems.length;
		for (var i=0; i<count; i++){
			obj = document.getElementById(arritems[i]);
			if (obj){obj.checked = Value;}			
		}
	}else{
		arritems = document.getElementsByName(FieldName);
		count = arritems.length;
		if (!count){arritems.checked = Value;}
		else{
			for (var i=0; i<count; i++){
				arritems[i].checked = Value;
			}			
		}
	}

	if(updateCommandBar) updateCommandBar();
}

function isVersionSelected()
{
	var isRevisionSelected = false;	
	var items = document.getElementsByName("__sel");	
	for(var i =0; i < items.length && !isRevisionSelected; i++)
	{   		
		if(!items[i].checked)
		{
			continue;
		}
		var parent = items[i].parentElement;
		while(parent)
		{
			if(parent.name == "DesRepeaterRow")
			{
			  isRevisionSelected = parent.ver;
			  break;
			}

			parent = parent.parentElement;
		}		
	}

	return isRevisionSelected;
}

function updateCommandBar()
{
	var isRevisionSelected = isVersionSelected();

	var links =  document.getElementsByTagName("a");
	for(var i =0; i < links.length; i++)
	{
		link = links[i];
		if(link.DisableForRevision)
		{
			link.disabled = isRevisionSelected;
		} 
	}
	
	if(self.UpdateButtons) {
		UpdateButtons();
	}
}

function EnsureSelection (FieldName){

	if(window.event.srcElement.disabled)
	{
		return false;
	}
	var arritems = document.getElementsByName(FieldName);
	var count = arritems.length;
	var got1 = false;
	if (!count){got1 = false;}
	else{
		for (var i=0; i<count; i++){
				if (arritems[i].checked){got1 = true; break;}
			}
	}
	if (!got1){
		alert(ItemMustBeSelectedMessage);
		return false;
	}
	return true;
}

// This function is used for copying math regions on the preview page.
//It is called from menuitems declared in mcdContextMenuCtl.ascx
function CopyRedirect(copyType)
{
	var loc = window.location.pathname + '?__tgt=';	
	loc += getTargetID();
	
	var path = getQueryStringParam("_path");
	if(path)
	{
		loc += "&_path=" + path;
	}
	
	loc += "&ClipRegionId=" + document.forms(0).__act.value;
	loc += "&CopyType=" + copyType;
	loc += "&ScrollPos=" + document.forms(0).__SCROLLPOS.value;

	window.location.href = loc;
}

function getTargetID(){
	return getQueryStringParam("__tgt");
}

function getQueryStringParam(paramName)
{   
	paramName = paramName + "=";	
	var url = window.location.href;
	if(url.indexOf(paramName) < 0)
	{
		return;
	}
	var pos = url.indexOf(paramName) + paramName.length;
	var poundPos = url.indexOf("#", pos);
	var endPos = url.indexOf("&", pos);
	if( poundPos >= 0 && (poundPos < endPos || endPos == -1))
	{
		endPos = poundPos;
	}
	var ID = url.substring(pos, endPos == -1 ? url.length : endPos);
	return ID;
}


///////////////////////////////////////////////////////////////////////////
// Override for UpdatableCommandButton.SetEnabledState()
///////////////////////////////////////////////////////////////////////////
function EnabledStateHandlerForDiffButton()
{
	checkedItems = GetSelectedItems();

	var link = this.GetLink();
	if(link)
	{
		if(checkedItems.length == 0 || checkedItems.length > 2)
		{
			link.disabled = true;
		}
		else
		{
			var nonXmcdFound = false;
			for(var i =0; i < checkedItems.length; ++i)
			{
				if(!IsXmcdFile(checkedItems[i]))
				{
					nonXmcdFound = true;
					break;
				}
			}
			link.disabled = nonXmcdFound;
		}
	}   		
}

function EnabledStateHandlerForDeleteButton()
{
	checkedItems = GetSelectedItems();
	var link = this.GetLink();
	if(link)
		link.disabled = checkedItems.length == 0;
}

function EnabledStateHandlerForBindButton()
{
	var checkedItems = GetSelectedItems();

	var link = this.GetLink();

	//disable if no worksheets are selected
	if(link)
	{
		var disabled = true;
		for(var i =0; i < checkedItems.length; ++i)
		{
			if( IsXmcdFile(checkedItems[i]) )
			{
				disabled = false;
				break;
			}
		}
	
		link.disabled = disabled;
	}
}

function IsXmcdFile(file)
{
	var fileName = file.parentNode.parentNode.FileName;
	sCurrentExt = (fileName.substring(fileName.lastIndexOf(".") + 1)).toLowerCase();

	return sCurrentExt == "xmcdz" || sCurrentExt == "xmct" || sCurrentExt == "xmcd";
}

function DisplayDiffWindow(link)
{
	if(!link.disabled) {
		var diffWindowQueryString = '?src=' + checkedItems[0].id;

		if(checkedItems.length == 1)
		{
			ShowSelectSecondFileWindowFromQs(diffWindowQueryString + "&__tgt=" + getTargetID());
			return;
		}

		diffWindowQueryString += '&tgt=' + checkedItems[1].id;
		ShowDiffWindow(diffWindowQueryString, true);
	}
}

function ShowSelectSecondFileWindowFromQs(queryString)
{
	ShowWindow('SecondDiffFileSelector.aspx' + queryString);
}

function ShowDiffWindow(queryString, newWindowFlag)
{
	ShowWindow('XmcdDiff.aspx' + queryString, newWindowFlag ? "" : "WGSDiffWindow");
}

function GetSelectedItems()
{
	var items = document.getElementsByName("__sel");
	var checkedItems = new Array();
	for(var i =0; i < items.length; i++)
	{
		if(items[i].checked)
			checkedItems[checkedItems.length] = items[i];
	}

	return checkedItems;
}

function UpdateButtons()
{
	for(i = 0; i < updatableBtnList.length; i++) {
		updatableBtnList[i].SetEnabledState();
	}
}

function ShowSelectSecondFileWindow()
{
	ShowWindow('SecondDiffFileSelector.aspx?src=' + GetCurrentFileId() + "&__tgt=" + getTargetID());
	return false;
}

function ShowVisualizationWindow(operation, link)
{
	if(!link) {	// link not defined, this is coming from the context menu
		ShowWindow('Visualize.aspx?operation=' + operation + '&id=' + GetCurrentFileId(), "WGSVizWindow");
	}else if(!link.disabled) {	//link is defined, this is coming from the command bar
		//write out the selected items to the cookie
		var selectedGuids = '';
		for(i = 0; i < checkedItems.length; i++) {
			selectedGuids += checkedItems[i].id + ":";
		}
		selectedGuids = selectedGuids.substring(0, selectedGuids.length - 1);
		setCookie('selectedGuids', selectedGuids);

		ShowWindow('Visualize.aspx?operation=' + operation, "WGSVizWindow");
	}
}

function GetCurrentFileId()
{
	if(document.forms(0).__act.value != '')
		return document.forms(0).__act.value;

	return getTargetID();
}

function ShowWindow(url, name)
{
	if (!name){name = "";}
	win = window.open(url, name, 'toolbar=0,scrollbars=1,location=0,statusbar=0,menubar=0,resizable=1');
	if (win){win.focus();}
}

///////////////////////////////////////////////////////////////////////////
// CONSTRUCTOR: UpdatableCommandButton
// DESCRIPTION:
//   Creates an object representing a commandbar button that can be 
//   enabled or disabled
// PARAMETERS:
//   id - the id of the div containing the button. 
// See DisplayManager.aspx for how to use UpdatableCommandButton
///////////////////////////////////////////////////////////////////////////
function UpdatableCommandButton(id)
{
	this.Id = id;
	
	//function to get the actual link that is activated when the button the clicked.
	//This link's disabled property is set when the button is disabled or enabled.
	this.GetLink = function() {
		if(!this.m_link) {

			var button = document.getElementById(this.Id);
			if(button == null)
				return null;

			var links = button.getElementsByTagName("a");
			this.m_link = links[0];
		}

		return this.m_link;
	};

	this.m_link = this.GetLink();
}

///////////////////////////////////////////////////////////////////////////
// Function that mdetermines what an UpdatableCommandButton's state should 
// be and enables or disables it accordingly. The default condition is to 
// enable if atleast one checkbox is checked. Override this if a different 
// condition needs to be met.
///////////////////////////////////////////////////////////////////////////
UpdatableCommandButton.prototype.SetEnabledState = function() {
	checkedItems = GetSelectedItems();
	var link = this.GetLink();
	if(link)
		link.disabled = checkedItems.length == 0;
};

/////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////       
// FUNCTION: setCookie()
// DESCRIPTION:
//   Sets a cookie with the specified name and value
// PARAMETERS:
//   key - The Cookie's key
//   value - THe Cookie's value
// RETURNS:
//   none
/////////////////////////////////////////////////////////////////////// 
function setCookie(key, value)
{   
    document.cookie = key + "=" + escape(value);
}


///////////////////////////////////////////////////////////////////////       
// FUNCTION: getCookie()
// DESCRIPTION:
//   Retreives a cookie from the document
// PARAMETERS:
//   key - the key of the cookie to retrieve
// RETURNS:
//   The value of the cookie, or null if no value is found
/////////////////////////////////////////////////////////////////////// 
function getCookie(key)
{
    // cookies are separated by semicolons
    var aCookie = document.cookie.split("; ");
    for (var i=0; i < aCookie.length; i++)
    {
        // a name/value pair (a crumb) is separated by an equal sign
        var aCrumb = aCookie[i].split("=");
        if (key == aCrumb[0]) 
        return unescape(aCrumb[1]);
    }

    // a cookie with the requested name does not exist
    return null;
}
