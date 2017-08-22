function output = combineFigs(caseName, ctrlName, path)

    A = hgload(caseName);
    caseD=get(gca, 'Children');
    x_case=reshape(cell2mat(get(caseD, 'XData')), [], 1);
    y_case=reshape(cell2mat(get(caseD, 'YData')), [], 1);
    close all

    B = hgload(ctrlName);
    ctrlD=get(gca, 'Children');
    x_ctrl=reshape(cell2mat(get(ctrlD, 'XData')), [], 1);
    y_ctrl=reshape(cell2mat(get(ctrlD, 'YData')), [], 1);
    close all

    figure
    hold on
    scatter(x_case, y_case, 5, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', .0);
    scatter(x_ctrl, y_ctrl, 5, 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'b', 'MarkerFaceAlpha', .5, 'MarkerEdgeAlpha', .0);

    saveas(gcf, path)
    close all
end