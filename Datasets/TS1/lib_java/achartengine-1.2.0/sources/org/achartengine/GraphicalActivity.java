package org.achartengine;

import android.app.Activity;
import android.os.Bundle;
import org.achartengine.chart.AbstractChart;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/GraphicalActivity.class */
public class GraphicalActivity extends Activity {
    private GraphicalView mView;
    private AbstractChart mChart;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Bundle extras = getIntent().getExtras();
        this.mChart = (AbstractChart) extras.getSerializable(ChartFactory.CHART);
        this.mView = new GraphicalView(this, this.mChart);
        String title = extras.getString(ChartFactory.TITLE);
        if (title == null) {
            requestWindowFeature(1);
        } else if (title.length() > 0) {
            setTitle(title);
        }
        setContentView(this.mView);
    }
}
