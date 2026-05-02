package com.github.mikephil.charting.renderer;

import android.graphics.Canvas;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.animation.ChartAnimator;
import com.github.mikephil.charting.charts.Chart;
import com.github.mikephil.charting.charts.CombinedChart;
import com.github.mikephil.charting.data.ChartData;
import com.github.mikephil.charting.data.CombinedData;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.dataprovider.BarLineScatterCandleBubbleDataProvider;
import com.github.mikephil.charting.utils.ViewPortHandler;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/CombinedChartRenderer.class */
public class CombinedChartRenderer extends DataRenderer {
    protected List<DataRenderer> mRenderers;
    protected WeakReference<Chart> mChart;

    public CombinedChartRenderer(CombinedChart chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        super(animator, viewPortHandler);
        this.mChart = new WeakReference<>(chart);
        createRenderers(chart, animator, viewPortHandler);
    }

    protected void createRenderers(CombinedChart chart, ChartAnimator animator, ViewPortHandler viewPortHandler) {
        this.mRenderers = new ArrayList();
        CombinedChart.DrawOrder[] orders = chart.getDrawOrder();
        for (CombinedChart.DrawOrder order : orders) {
            switch (AnonymousClass1.$SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder[order.ordinal()]) {
                case BuildConfig.VERSION_CODE /* 1 */:
                    if (chart.getBarData() != null) {
                        this.mRenderers.add(new BarChartRenderer(chart, animator, viewPortHandler));
                        break;
                    } else {
                        break;
                    }
                case 2:
                    if (chart.getBubbleData() != null) {
                        this.mRenderers.add(new BubbleChartRenderer(chart, animator, viewPortHandler));
                        break;
                    } else {
                        break;
                    }
                case 3:
                    if (chart.getLineData() != null) {
                        this.mRenderers.add(new LineChartRenderer(chart, animator, viewPortHandler));
                        break;
                    } else {
                        break;
                    }
                case Chart.PAINT_GRID_BACKGROUND /* 4 */:
                    if (chart.getCandleData() != null) {
                        this.mRenderers.add(new CandleStickChartRenderer(chart, animator, viewPortHandler));
                        break;
                    } else {
                        break;
                    }
                case 5:
                    if (chart.getScatterData() != null) {
                        this.mRenderers.add(new ScatterChartRenderer(chart, animator, viewPortHandler));
                        break;
                    } else {
                        break;
                    }
            }
        }
    }

    /* renamed from: com.github.mikephil.charting.renderer.CombinedChartRenderer$1, reason: invalid class name */
    /* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/renderer/CombinedChartRenderer$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder = new int[CombinedChart.DrawOrder.values().length];

        static {
            try {
                $SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder[CombinedChart.DrawOrder.BAR.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder[CombinedChart.DrawOrder.BUBBLE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder[CombinedChart.DrawOrder.LINE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder[CombinedChart.DrawOrder.CANDLE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$github$mikephil$charting$charts$CombinedChart$DrawOrder[CombinedChart.DrawOrder.SCATTER.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void initBuffers() {
        for (DataRenderer renderer : this.mRenderers) {
            renderer.initBuffers();
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawData(Canvas c) {
        for (DataRenderer renderer : this.mRenderers) {
            renderer.drawData(c);
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawValues(Canvas c) {
        for (DataRenderer renderer : this.mRenderers) {
            renderer.drawValues(c);
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawExtras(Canvas c) {
        for (DataRenderer renderer : this.mRenderers) {
            renderer.drawExtras(c);
        }
    }

    @Override // com.github.mikephil.charting.renderer.DataRenderer
    public void drawHighlighted(Canvas c, Highlight[] indices) {
        Chart chart = this.mChart.get();
        if (chart == null) {
            return;
        }
        for (DataRenderer renderer : this.mRenderers) {
            ChartData data = null;
            if (renderer instanceof BarChartRenderer) {
                data = ((BarChartRenderer) renderer).mChart.getBarData();
            } else if (renderer instanceof LineChartRenderer) {
                data = ((LineChartRenderer) renderer).mChart.getLineData();
            } else if (renderer instanceof CandleStickChartRenderer) {
                data = ((CandleStickChartRenderer) renderer).mChart.getCandleData();
            } else if (renderer instanceof ScatterChartRenderer) {
                data = ((ScatterChartRenderer) renderer).mChart.getScatterData();
            } else if (renderer instanceof BubbleChartRenderer) {
                data = ((BubbleChartRenderer) renderer).mChart.getBubbleData();
            }
            int dataIndex = data == null ? -1 : ((CombinedData) chart.getData()).getAllData().indexOf(data);
            ArrayList<Highlight> dataIndices = new ArrayList<>();
            for (Highlight h : indices) {
                if (h.getDataIndex() == dataIndex || h.getDataIndex() == -1) {
                    dataIndices.add(h);
                }
            }
            renderer.drawHighlighted(c, (Highlight[]) dataIndices.toArray(new Highlight[dataIndices.size()]));
        }
    }

    @Override // com.github.mikephil.charting.renderer.Renderer
    public void calcXBounds(BarLineScatterCandleBubbleDataProvider chart, int xAxisModulus) {
        for (DataRenderer renderer : this.mRenderers) {
            renderer.calcXBounds(chart, xAxisModulus);
        }
    }

    public DataRenderer getSubRenderer(int index) {
        if (index >= this.mRenderers.size() || index < 0) {
            return null;
        }
        return this.mRenderers.get(index);
    }

    public List<DataRenderer> getSubRenderers() {
        return this.mRenderers;
    }

    public void setSubRenderers(List<DataRenderer> renderers) {
        this.mRenderers = renderers;
    }
}
