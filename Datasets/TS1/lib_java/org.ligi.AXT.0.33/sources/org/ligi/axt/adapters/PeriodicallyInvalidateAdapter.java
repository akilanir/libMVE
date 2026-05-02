package org.ligi.axt.adapters;

import android.app.Activity;
import android.app.ListActivity;
import android.widget.BaseAdapter;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/PeriodicallyInvalidateAdapter.class */
public class PeriodicallyInvalidateAdapter implements Runnable {
    private final Activity ctx;
    private final Invalidator myInvalidator;
    private boolean running = true;

    public PeriodicallyInvalidateAdapter(ListActivity ctx, BaseAdapter adapter) {
        this.ctx = ctx;
        this.myInvalidator = new Invalidator(adapter);
        new Thread(this).start();
    }

    /* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/PeriodicallyInvalidateAdapter$Invalidator.class */
    class Invalidator implements Runnable {
        private BaseAdapter adapter;

        public Invalidator(BaseAdapter adapter) {
            this.adapter = adapter;
        }

        @Override // java.lang.Runnable
        public void run() {
            this.adapter.notifyDataSetChanged();
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        while (this.running) {
            try {
                this.ctx.runOnUiThread(this.myInvalidator);
                Thread.sleep(200L);
            } catch (Exception e) {
            }
        }
    }
}
