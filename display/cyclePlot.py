import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

# display graph from gexFile (written with writeGEXFwPositions)

def cyclePlot(gexFile):
    DG1 = nx.DiGraph(nx.read_gexf(gexFile))
    #generate networkx friendly position format
    #dictionary keyed by node label with values being a float32 ndarray
    pos = dict()
    for i in range(1, len(DG1.node)+1):
        xPos = DG1.node[str(i)]['viz']['position']['x']
        yPos = DG1.node[str(i)]['viz']['position']['y']
        pos[str(i)] = np.array([xPos,yPos])
    
  
    nx.draw_networkx_nodes(DG1,pos,nodelist=DG1.node.keys(),
                       node_size=10,
                       node_color='grey',
                       alpha=0.4)
    nx.draw_networkx_edges(DG1,pos,alpha=0.3,
                               arrows=True,
                               edge_color='b')
    plt.show()
