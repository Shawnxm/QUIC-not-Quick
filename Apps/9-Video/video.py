import os
from os import path
import pandas as pd
import matplotlib.pyplot as plt

plt.rc('font', family='sans-serif', serif='cm10')
plt.rc('text', usetex=False)
cmap20 = plt.cm.tab20
colorlist20 = [cmap20(i) for i in range(cmap20.N)]

LABEL_SIZE = 18
AXIS_SIZE = 16
LEGEND_SIZE = 16

feature_list = ["abr", "network", "chunkDuration"]

def draw_plot_upgrade(df, name):

    df["combined_setting"] = df["abr"] + "-" + df["network"].astype("string") + "-" + df["chunkDuration"].astype("string")
    grp_outer_df = df.groupby(name)
    grp_outer_index_list = list(grp_outer_df.groups.keys())

    for grp_index in grp_outer_index_list:
        temp_temp_df = grp_outer_df.get_group(grp_index)
        grp_df = temp_temp_df.groupby(["abr", "network", "chunkDuration"])
        index_group_list = list(grp_df.groups.keys())

        fig, ax = plt.subplots(figsize=(6, 4))
        plt.grid(True)

        fc_list = ["blue", "deepskyblue", "lightblue","darkred", "red", "tomato"]
        ec_list = ["blue", "deepskyblue", "lightblue","darkred", "red", "tomato"]
        marker_list = ["o", "D"]

        bitrate_avg_total_list = []

        for idx, index in enumerate(index_group_list):
            
            abr, network, chunkDuration = index
            temp_df = grp_df.get_group(index)
            temp_df = temp_df.sort_values(by=["http"])
            
            bitRateAvg_list = temp_df["bitrateAvg"].tolist() #[http2, http3]
            bitRateStd_list = temp_df["bitrateStd"].tolist()
            bitrate_avg_total_list = bitrate_avg_total_list + bitRateAvg_list
            plt.errorbar(bitRateAvg_list[0], bitRateAvg_list[1], xerr=bitRateStd_list[0], yerr=bitRateStd_list[1],  color=ec_list[idx], ecolor=ec_list[idx], capsize=3, capthick=1, elinewidth=3)
            plt.scatter(bitRateAvg_list[0], bitRateAvg_list[1], color=fc_list[idx], s=80, label=f"{abr}-{chunkDuration}", marker=marker_list[int(idx/3)])

        min_range = min([ax.get_xlim()[0], ax.get_ylim()[0]])
        max_range = max([ax.get_xlim()[1], ax.get_ylim()[1]])

        ax.set_xlim(min_range, max_range)
        ax.set_ylim(min_range, max_range)
        ax.plot([min_range, max_range], [min_range, max_range], color='gray', linestyle='--', dashes=(5, 3), linewidth=2)
        plt.legend(loc='upper left', handletextpad=0.2, fontsize=LEGEND_SIZE)

        plt.xticks(fontsize=AXIS_SIZE)
        plt.yticks(fontsize=AXIS_SIZE)
        plt.xlabel("HTTP/2 Bitrate (Mbps)", fontsize=LABEL_SIZE)
        plt.ylabel("HTTP/3 Bitrate (Mbps)", fontsize=LABEL_SIZE)
        plt.tight_layout()
        plt.savefig("video_{}.pdf".format(grp_index), dpi=300)

if __name__ == '__main__':
    df_list = []
    for abr in ["bb", "rb"]:
        data_file = path.join(os.curdir, f"{abr}-summary.csv")
        _df = pd.read_csv(data_file, names=["http", "network", "chunkDuration", "stallRatioAvg", "stallRatioStd", "bitrateAvg", "bitrateStd"])
        _df["abr"] = abr.upper()
        df_list.append(_df)

    df = pd.concat(df_list)
    draw_plot_upgrade(df, ["network"])
