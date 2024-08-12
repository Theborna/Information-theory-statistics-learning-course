%% Part 1
mu = [0, 0.25, 0.5, 1, 2, 4];
for i = 1:6
    subplot(2, 3, i)
    plot_region(mu(i), 1)
end

sgtitle('Neyman-Pearson Region $\mathcal{R}(\mathcal{N}(0,1), \mathcal{N}(\mu, 1))$', 'Interpreter','latex');

% Add grid
grid on;
%% Part 2
n = [1, 2, 3, 4, 5, 6];
for i = 1:6
    subplot(2, 3, i)
    plot_region(1, n(i))
end

sgtitle('Neyman-Pearson Region $\mathcal{R}(\mathcal{N}(0,1), \mathcal{N}(\mu, 1))$', 'Interpreter','latex');

function p = plot_region(mu, N)
    x = 0:0.01:1;
    mu0 = mu;
    mu = sqrt(N) * mu;
    y1 = qfunc(mu - qfuncinv(1 - x));
    % plot(x, y1, 'b'); % Plot the first curve in blue
    hold on
    y2 = 1 - qfunc(mu - qfuncinv(x));
    % plot(x, y2, 'b--'); % Plot the second curve in blue dashed
    size([x, fliplr(x)]')
    % Fill the area between the curves
    p = fill([x, fliplr(x)]', [y2, fliplr(y1)]', ...
        'b', 'FaceAlpha', 0.3); % Fill with blue color and 30% transparency
    
    p.EdgeColor = 'b';
    p.LineWidth = 1.5;
    
    % Add labels and title
    xlabel('$P[Z=0]$', 'Interpreter','latex');
    ylabel('$Q[Z=0]$', 'Interpreter','latex');
    
    title(['$\mu = ', sprintf('%0.2f', mu0) , '\ , N = ', int2str(N), '$'], 'Interpreter','latex')
end