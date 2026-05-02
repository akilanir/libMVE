package org.ligi.axt.base_activities;

import android.R;
import android.app.Activity;
import android.app.ListActivity;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/base_activities/RefreshingStringBaseListActivity.class */
public abstract class RefreshingStringBaseListActivity extends ListActivity implements Runnable {
    private myArrayAdapter adapter;
    private boolean running = true;
    final Handler mHandler = new Handler();
    final Runnable mUpdateResults = new Runnable() { // from class: org.ligi.axt.base_activities.RefreshingStringBaseListActivity.1
        @Override // java.lang.Runnable
        public void run() {
            RefreshingStringBaseListActivity.this.adapter.notifyDataSetChanged();
        }
    };

    public abstract String getStringByPosition(int i);

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.adapter = new myArrayAdapter(this);
        setListAdapter(this.adapter);
        new Thread(this).start();
    }

    /* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/base_activities/RefreshingStringBaseListActivity$myArrayAdapter.class */
    class myArrayAdapter extends BaseAdapter {
        private Activity context;
        private int count;

        public myArrayAdapter(Activity context) {
            int i;
            this.count = 0;
            this.context = context;
            do {
                i = this.count;
                this.count = i + 1;
            } while (RefreshingStringBaseListActivity.this.getStringByPosition(i) != null);
        }

        @Override // android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            LayoutInflater vi = (LayoutInflater) this.context.getSystemService("layout_inflater");
            View row = vi.inflate(R.layout.simple_list_item_1, (ViewGroup) null);
            TextView label = (TextView) row.findViewById(R.id.text1);
            label.setText(RefreshingStringBaseListActivity.this.getStringByPosition(position));
            return row;
        }

        @Override // android.widget.Adapter
        public int getCount() {
            return this.count;
        }

        @Override // android.widget.Adapter
        public Object getItem(int arg0) {
            return null;
        }

        @Override // android.widget.Adapter
        public long getItemId(int position) {
            return 0L;
        }
    }

    @Override // android.app.ListActivity, android.app.Activity
    protected void onDestroy() {
        this.running = false;
        super.onDestroy();
    }

    public int getRefreshSleep() {
        return 100;
    }

    @Override // java.lang.Runnable
    public void run() {
        while (this.running) {
            this.mHandler.post(this.mUpdateResults);
            try {
                Thread.sleep(getRefreshSleep());
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
