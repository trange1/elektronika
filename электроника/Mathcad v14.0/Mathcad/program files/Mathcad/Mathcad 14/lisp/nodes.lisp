(in-package "front12.nodes")

;; We don't have CLOS, but with a little data
;; abstraction we can get the effect we need.

(export 'make-node-map 'new-ce-node 'delete-ce-nodes
        'insert-front-node 'remove-front-node
        'last-ce-node)

(defun make-node-map (top-node node-factory node-finalizer)
  (list top-node node-factory node-finalizer (System.Collections.Hashtable)))

(defmacro with-map (node-map &rest body)
  `(let ((top-node       (nth 0 ,node-map))
         (node-factory   (nth 1 ,node-map))
         (node-finalizer (nth 2 ,node-map))
         (table          (nth 3 ,node-map)))
     (progn ,@body)))

(defun new-ce-node (node-map front-node lazy? data)
  (with-map 
   node-map
   (let* ((nc        (get-hash table front-node))
          (prev-ce   (or (get-last-ce-node nc) top-node))
          (new-ce    (node-factory front-node lazy? prev-ce data))
          (new-nodes (cons new-ce (get-ce-nodes nc))))
     (set-ce-nodes nc new-nodes)
     new-ce)))

(defun delete-ce-nodes (node-map front-node)
  (with-map
   node-map
   (let ((nc (get-hash table front-node)))
     (and nc 
          (mapcar node-finalizer (get-ce-nodes nc))
          (set-ce-nodes nc nil)))))

(defun insert-front-node (node-map front-node new-front-node after?)
  (with-map
   node-map
   (let ((new-nc (make-node-collection nil nil nil))
         (nc (get-hash table front-node)))
     (if after? 
         (insert-after nc new-nc)
       (insert-before nc new-nc))
     (set-hash table new-front-node new-nc)
     new-front-node)))
            
(defun remove-front-node (node-map front-node)
  (with-map
      node-map
    (delete-ce-nodes node-map  front-node)
    (remove-nc (get-hash table front-node))))

(defun last-ce-node (node-map front-node)
  (with-map
   node-map
   (let* ((nc        (get-hash table front-node))
          (prev-ce   (or (get-last-ce-node nc) top-node)))
     prev-ce)))

;(export 'make-node-collection 'get-ce-nodes 'set-ce-nodes
;        'insert-after 'insert-before 'remove-nc 'get-last-ce-node)
;
(defun make-node-collection (prev next ce-nodes)
  (list prev next ce-nodes))

(defun get-next (nc)
  (and nc (cadr nc)))

(defun set-next (nc1 nc2)
  (if nc1
      (let ((c (cdr nc1)))
        (setf (car c) nc2))
    nc2))

(defun get-prev (nc)
  (and nc (car nc)))

(defun set-prev (nc1 nc2)
  (if nc1
      (setf (car nc1) nc2)
    nc2))

(defun get-ce-nodes (nc)
  (and nc (car (cdr (cdr nc)))))

(defun set-ce-nodes (nc ce-nodes)
  (let ((c (cdr (cdr nc))))
    (setf (car c) ce-nodes)
    nc))

(defun get-last-ce-node (nc)
  (let ((nn (get-ce-nodes nc))
        (pn (get-prev nc)))
    (cond (nn (car nn))
          (pn (get-last-ce-node pn))
          (t  nil))))

(defun insert-after (nc new-nc)
  (let ((nc-next (get-next nc)))
    (link nc new-nc)
    (link new-nc nc-next)))

(defun insert-before (nc new-nc)
  (let ((nc-prev (get-prev nc)))
    (link nc-prev new-nc)
    (link new-nc nc)))

(defun remove-nc (nc)
  (let ((next (get-next nc))
        (prev (get-prev nc)))
    (link prev next)))

(defun link (nc1 nc2)
  (set-next nc1 nc2)
  (set-prev nc2 nc1))


