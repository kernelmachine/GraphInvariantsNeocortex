function [ adjMatrix ] = pdf2adjcorr(pdfMatrix,threshold)
            %pdf2adjcorr  makes adjacency matrix from pdfMatrix of spiking activity
            %   Makes a count adjacency matrix from a pdf
            %   pdfMatrix = input [0 1] spike probability, rows=cells, columns = time
            %   threshhold = pdf threshhold value for cutoff of connectivity range [0 1]
            
            [numNodes,numFrames]=size(pdfMatrix);
            adjMatrix=zeros(numNodes,numNodes);

            % lagged correlation option
            %so, a non-normalized correlation turns into just a sum more/less....
            pdfMatrix(pdfMatrix < 10e-10) = 0;
            for(i=1:numNodes)
                for(j=1:numNodes)
                    if(i~=j)
                        %this line is equal to the below but below is FASTER by 10x
%                          [r,lags]=xcorr(double(pdfMatrix(i,:)>threshold),double(pdfMatrix(j,:)>threshold),-1);
                         adjMatrix(i,j)=sum((double(pdfMatrix(i,1:end-1)>threshold)+double(pdfMatrix(j,2:end)>threshold)==2));
                    end
                end
            end
            