///y_to_gy(y)

var yy = argument0;

if(yy < y)
{
    return -1;
}
else
{
    return floor(((yy - y) / 32));
}
