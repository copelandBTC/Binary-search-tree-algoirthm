with ada.text_io; use ada.text_io;
with bin_tree;

procedure main is
   type string10 is new string (1 .. 10);
   type customer is record
      name  : string10;
      phone : string10;
   end record;

   function "<" (thekey : in string10; rec : customer) return boolean is
   begin
      if thekey < rec.name then
         return true;
      else
         return false;
      end if;
   end;

   function ">" (thekey : in string10; rec : customer) return boolean is
   begin
      if thekey > rec.name then
         return true;
      else
         return false;
      end if;
   end;

   function "=" (thekey : in string10; rec : customer) return boolean is
   begin
      if thekey = rec.name then
         return true;
      else
         return false;
      end if;
   end;

   package new_tree is new bin_tree (string10, customer, "<", ">", "=");
begin
   put_line ("C OPTION DATA");
   put_line ("-------------");
   new_line;

   new_tree.insert("Ajose     ", "295-1492  ");
   new_tree.insert("Owens     ", "291-1864  ");
   new_tree.insert("Federbush ", "295-1601  ");
   new_tree.insert("Ryba      ", "293-6122  ");
   new_tree.insert("Seddon    ", "295-1882  ");
   new_tree.insert("Copeland  ", "291-7890  ");
   new_tree.insert("Voorhees  ", "294-8075  ");
   new_tree.insert("Sparks    ", "584-3622  ");

   put_line(new_tree.cust_phone(new_tree.find_iterative ("Ryba      ")));
   put_line(new_tree.cust_phone(new_tree.find_recursive ("Ryba      ")));
   put_line(new_tree.cust_phone(new_tree.find_iterative ("Newton    ")));
   put_line(new_tree.cust_phone(new_tree.find_recursive ("Newton    ")));

   new_line;
   put_line ("IN-ORDER:");
   new_tree.inorder("Copeland  ");
   new_line;

   new_tree.insert("Vickers   ", "294-1568  ");
   new_tree.insert("Gunn      ", "294-1882  ");
   new_tree.insert("Zulfiquar ", "295-6622  ");

   new_line;
   put_line ("IN-ORDER:");
   new_tree.inorder("Ajose     ");
   new_line;

   -- B option
   new_line;
   put_line ("B OPTION DATA");
   put_line ("-------------");
   new_line;

   new_tree.delete ("Ajose     ");
   new_tree.delete ("Copeland  ");
   new_tree.delete ("Aguira    ");

   new_tree.insert("Novak     ", "294-1666  ");
   new_tree.insert("Gonzales  ", "295-1882  ");

   new_line;
   put_line ("IN-ORDER:");
   new_tree.inorder(new_tree.cust_name(new_tree.root));
   new_line;

   new_line;
   put_line ("REVERSE IN-ORDER:");
   new_tree.reverse_in(new_tree.root);
   new_line;

   put_line ("PRE-ORDER:");
   new_tree.preorder(new_tree.root);
   new_line;

   -- A option
   new_line;
   put_line ("A OPTION DATA");
   put_line ("-------------");
   new_line;

   new_line;
   put_line ("POST-ORDER ITERATIVE:");
   new_tree.postorder_iter(new_tree.root);
   new_line;

   new_line;
   put_line ("POST-ORDER RECURSIVE:");
   new_tree.postorder_recurs(new_tree.root);
   new_line;

   new_tree.free_all;

   new_line;
   put_line ("Final program terminated. Thanks for the challenge, Dr. Burris. I learned a lot.");
   new_line;
end main;
