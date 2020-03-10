a = 10;
n_max = 100;
r_max = a/3;

function plot_circ(X, Y, R)
theta = linspace(0,2*pi);
x = R*cos(theta) + X;
y = R*sin(theta) + Y;
plot(x,y)
end


vx = [];
vy = [];
vr = [];
sumarea = [];
area=0;
sumdraws = [];
n = 0;

while (n<n_max)
  draws = 0;
  while (true)
  draws = draws + 1;
  x = a * rand(1);
  y = a * rand(1);
  r = r_max * rand(1);
    if(x - r > 0 && x + r < a && y - r > 0 && y + r < a)
    break 
    end
  end
  
  intersect = false;
  for i = 1:n
    dx = x-vx(i);
    dy = y-vy(i);
    d = sqrt(dx*dx + dy*dy);
    if ( d < vr(i) + r && d > abs(vr(i) - r))
     intersect = true;
     break;
    elseif (d == vr(i) + r)
     intersect = true;
     break;
    end
  end
  
  if (inttersect == false)
      n = n + 1;
      axis equal
      plot_circ(x,y,r);
      
      sumdraws(n) = draws;
      vx(n) = x;
      vy(n) = y;
      vr(n) = r;
      area = area + pi*r*r;
      sumarea(n) = area;
      
      hold on
      
      fprintf(1, ' %s%5d%s%.3g\r ', 'n =',  n, ' S = ', sumarea(n))
      %pause(0.01)
  end
 
end

figure('Name', 'Area');
semilogx(1:n, sumarea);
   
figure('Name', 'Avg draws');
loglog(cumsum(sumdraws)./(linspace(1,n,n)));
