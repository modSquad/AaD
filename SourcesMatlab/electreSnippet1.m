for i = 1:n
	J(:,i) = ( (J(:,i) - (e/2)) * (w(i)/max(w))) + (e/2);
end;

