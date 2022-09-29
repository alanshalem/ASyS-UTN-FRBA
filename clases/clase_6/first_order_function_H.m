function [ dy ] = first_order_function_H(t,y,ft)

ft = ft(t); % Apunto el puntero a función evaluado en el t que corresponda

Ch=5;
Rh=0.8;
dy = (1/Ch)*ft-(1/(Rh*Ch))*y;

end

