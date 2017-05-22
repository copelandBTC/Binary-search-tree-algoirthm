generic
   type key is private;
   type tree_rec is private;
   with function "<" (thekey : in key; rec : tree_rec) return boolean;
   with function ">" (thekey : in key ; rec : tree_rec) return boolean;
   with function "=" (thekey : in key; rec : in tree_rec) return boolean;

package bin_tree is
   subtype string10 is string (1 .. 10);
   type tree_pnt is limited private;

   procedure initialize;
   procedure insert (name : string10; phone : string10);
   procedure delete (name : string10);
   function find_iterative (name : string10) return tree_pnt;
   function find_recursive (name : string10) return tree_pnt;
   procedure inorder (name : string10);
   procedure preorder (point : in tree_pnt);
   procedure postorder_iter (point : in tree_pnt);
   procedure postorder_recurs (point : in tree_pnt);
   procedure reverse_in (point : tree_pnt);
   function inorder_succ (point : in tree_pnt) return tree_pnt;
   function inorder_pred (point : in tree_pnt) return tree_pnt;
   function cust_name (point : in tree_pnt) return string10;
   function cust_phone (point : in tree_pnt) return string10;
   function root return tree_pnt;
   procedure print_info (point : in tree_pnt);
   procedure free_all;

private
   type node;
   type customer is record
      name  : string10;
      phone : string10;
   end record;

   type tree_pnt is access node;
   type node is record
      llink, rlink : tree_pnt;
      ltag, rtag   : boolean;      -- true = +; false = -
      info         : customer;
   end record;
end bin_tree;
