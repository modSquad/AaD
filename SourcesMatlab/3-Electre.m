function ORD = electre3 (J,p,s,v)

if size(J,2) != size(p)
error("Size doesn't match.");
end if;