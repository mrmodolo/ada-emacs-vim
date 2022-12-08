with Ada.Text_IO;   use Ada.Text_IO;
with GNATCOLL .JSON; use GNATCOLL.JSON;

procedure JSON is

   --  Create a JSON value from scratch
   My_Obj : JSON_Value := Create_Object;
begin
   My_Obj.Set_Field (Field_Name => "field1", Field => Create (Integer (1)));
   My_Obj.Set_Field ("name", "marcelo");
   My_Obj.Set_Field ("age", Integer (59));
   My_Obj.Set_Field ("height", 104.0);

   --  Now serialize it. The call below will display:
   --    {"field1": 1, "name": "thename"}
   Put_Line (My_Obj.Write);
end JSON;
