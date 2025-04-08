# %%
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import csv
import os
# %%
results = {}
for engine in os.listdir("../results"):
    results[engine]={}
    for subset in ["ES", "FR", "ERA"]:
        results[engine][subset]={}
        for shapes in ['core', 'era', 'tds']:
            try:
                results[engine][subset][shapes] = pd.read_csv(f"../results/{engine}/{subset}_{shapes}_results.csv").drop(0)
                results[engine][subset][shapes]['cummulative'] = results[engine][subset][shapes]['loading']+results[engine][subset][shapes][' validation']
            except:
                pass

# %%
def config_ax(ax, engines, results, subset, shapes, indicator):
    values = []
    values_err = []
    for engine in engines:
        try:
            values.append(results[engine][subset][shapes][indicator].mean())
            values_err.append(results[engine][subset][shapes][indicator].std())
        except:
            values.append(np.nan)
            values_err.append(np.nan)

    ax.bar(engines, values)
    ax.errorbar(engines, values, values_err, fmt='none', color='black', markersize=2, capsize=4)
    ax.set_yscale("log")
    ax.set_autoscaley_on
    plt.grid(axis='y')
    ax.set_axisbelow(True)

def plot_bench(engines, results, indicator):
    fig, axs = plt.subplots(3,3, sharex=True, layout='constrained', sharey='row')
    fig.suptitle(f'{indicator}')
    axs[0,0].set_ylabel('ERA ~55M')
    axs[0,0].set_title('tds')
    axs[0,1].set_title('core')
    axs[0,2].set_title('core + sparql')
    axs[1,0].set_ylabel('FR ~10M')
    axs[2,0].set_ylabel('ES ~1M')
    axs[2,0].tick_params(axis='x', labelrotation=90)
    axs[2,1].tick_params(axis='x', labelrotation=90)
    axs[2,2].tick_params(axis='x', labelrotation=90)
    config_ax(axs[0,0], engines, results, 'ERA', 'tds', indicator)
    config_ax(axs[0,1], engines, results, 'ERA', 'core', indicator)
    config_ax(axs[0,2], engines, results, 'ERA', 'era', indicator)
    config_ax(axs[1,0], engines, results, 'FR', 'tds', indicator)
    config_ax(axs[1,1], engines, results, 'FR', 'core', indicator)
    config_ax(axs[1,2], engines, results, 'FR', 'era', indicator)
    config_ax(axs[2,0], engines, results, 'ES', 'tds', indicator)
    config_ax(axs[2,1], engines, results, 'ES', 'core', indicator)
    config_ax(axs[2,2], engines, results, 'ES', 'era', indicator)

engines = ['maplib-0.12', 'jena', 'topbraid', 'rdf4j', 'rdfunit', 'dotnet_rdf','pyshacl', 'corese' ] # list(results.keys())
plot_bench(engines, results, 'loading')
plot_bench(engines, results, ' validation')
plot_bench(engines, results, ' memory_usage')
plot_bench(engines, results, 'cummulative')


# %%
