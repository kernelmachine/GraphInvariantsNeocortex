function [] = visualizeRaster(raster,threshold)

    figure;
    data = raster > threshold;
    imagesc(data)
    colormap(flipud(gray));
    set(gca,'xtick',timeVecF,'xticklabel',timeVec)
    figure;
    plot(sum(data)')
    set(gca,'xtick',timeVecF,'xticklabel',timeVec)
    ylabel('Count of Active Neurons');xlabel('time (ms)')
end