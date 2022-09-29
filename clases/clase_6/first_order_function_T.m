function [ dy ] = first_order_function_T(t,y,ft)

ft = ft(t); % Apunto el puntero a función evaluado en el t que corresponda

Cth=2;
Rth=0.5;
dy = (1/Cth)*ft-(1/(Rth*Cth))*y;

end

