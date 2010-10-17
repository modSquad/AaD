function result = compute_stock(input)
    if input < 1192 && input > 0
        result = (input / 1192) * 100;
    elseif input > 1192 && input < 1559 
        result = 100;
    elseif input >= 1691 && input >= 1559
        result = (-input/1192 + 1 + 1559/1192) * 100;
    end
end