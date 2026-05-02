package org.ligi.axt.adapters;

import android.R;
import android.content.Context;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.widget.SimpleCursorAdapter;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/adapters/LinkAndDescriptionAdapter.class */
public class LinkAndDescriptionAdapter extends SimpleCursorAdapter {
    public static SimpleCursorAdapter createByArray(Context ctx, LinkWithDescription[] links) {
        return createByArray(ctx, links, R.layout.two_line_list_item);
    }

    public static SimpleCursorAdapter createByArray(Context ctx, LinkWithDescription[] links, int resid) {
        String[] matrix = {"_id", "name", "value"};
        String[] columns = {"name", "value"};
        int[] layouts = {R.id.text1, R.id.text2};
        MatrixCursor cursor = new MatrixCursor(matrix);
        int i = 0;
        for (LinkWithDescription link : links) {
            if (link instanceof LinkWithDescriptionAndTitle) {
                int i2 = i;
                i++;
                cursor.addRow(new Object[]{Integer.valueOf(i2), ((LinkWithDescriptionAndTitle) link).getTitle(), ((LinkWithDescriptionAndTitle) link).getDescription()});
            } else {
                int i3 = i;
                i++;
                cursor.addRow(new Object[]{Integer.valueOf(i3), link.getDescription(), link.getURL()});
            }
        }
        return new SimpleCursorAdapter(ctx, resid, cursor, columns, layouts);
    }

    public LinkAndDescriptionAdapter(Context context, int layout, Cursor c, String[] from, int[] to) {
        super(context, layout, c, from, to);
    }
}
