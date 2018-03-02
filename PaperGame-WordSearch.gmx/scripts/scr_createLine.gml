var a;
a = instance_create(0,0,obj_line);
a.Ax = mouse_xstart;
a.Ay = mouse_ystart;
a.Bx = mouse_x;
a.By = mouse_y;
a.clr = line_color;
show_debug_message('create ' + string(a.Ax));
