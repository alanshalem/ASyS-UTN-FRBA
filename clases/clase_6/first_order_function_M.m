function [ dy ] = first_order_function_M(t,y,ft)

ft = ft(t); % Apunto el puntero a función evaluado en el t que corresponda

J=1;
D=0.5;
dy = (1/J)*ft-(D/J)*y;

end

