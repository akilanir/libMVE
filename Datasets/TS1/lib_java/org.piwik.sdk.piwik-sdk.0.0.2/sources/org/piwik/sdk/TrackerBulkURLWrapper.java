package org.piwik.sdk;

import android.text.TextUtils;
import java.net.URL;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.piwik.sdk.tools.Logy;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/TrackerBulkURLWrapper.class */
public class TrackerBulkURLWrapper {
    private static final String LOGGER_TAG = "PIWIK:TrackerBulkURLWrapper";
    private static final int EVENTS_PER_PAGE = 20;
    private int mCurrentPage = 0;
    private final int mPages;
    private final URL mApiUrl;
    private final String mAuthtoken;
    private final List<String> mEvents;

    static /* synthetic */ int access$008(TrackerBulkURLWrapper x0) {
        int i = x0.mCurrentPage;
        x0.mCurrentPage = i + 1;
        return i;
    }

    public TrackerBulkURLWrapper(URL apiUrl, List<String> events, String authToken) {
        this.mApiUrl = apiUrl;
        this.mAuthtoken = authToken;
        this.mPages = (int) Math.ceil((events.size() * 1.0d) / 20.0d);
        this.mEvents = events;
    }

    protected static int getEventsPerPage() {
        return EVENTS_PER_PAGE;
    }

    public Iterator<Page> iterator() {
        return new Iterator<Page>() { // from class: org.piwik.sdk.TrackerBulkURLWrapper.1
            @Override // java.util.Iterator
            public boolean hasNext() {
                return TrackerBulkURLWrapper.this.mCurrentPage < TrackerBulkURLWrapper.this.mPages;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Iterator
            public Page next() {
                if (hasNext()) {
                    return TrackerBulkURLWrapper.this.new Page(TrackerBulkURLWrapper.access$008(TrackerBulkURLWrapper.this));
                }
                return null;
            }

            @Override // java.util.Iterator
            public void remove() {
            }
        };
    }

    public URL getApiUrl() {
        return this.mApiUrl;
    }

    public JSONObject getEvents(Page page) {
        if (page == null || page.isEmpty()) {
            return null;
        }
        List<String> pageElements = this.mEvents.subList(page.fromIndex, page.toIndex);
        if (pageElements.size() == 0) {
            Logy.w(LOGGER_TAG, "Empty page");
            return null;
        }
        JSONObject params = new JSONObject();
        try {
            params.put("requests", new JSONArray((Collection) pageElements));
            if (this.mAuthtoken != null) {
                params.put(QueryParams.AUTHENTICATION_TOKEN.toString(), this.mAuthtoken);
            }
            return params;
        } catch (JSONException e) {
            Logy.w(LOGGER_TAG, "Cannot create json object", e);
            Logy.i(LOGGER_TAG, TextUtils.join(", ", pageElements));
            return null;
        }
    }

    public String getEventUrl(Page page) {
        if (page == null || page.isEmpty()) {
            return null;
        }
        return getApiUrl().toString() + this.mEvents.get(page.fromIndex);
    }

    /* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/TrackerBulkURLWrapper$Page.class */
    public final class Page {
        protected final int fromIndex;
        protected final int toIndex;

        protected Page(int pageNumber) {
            if (pageNumber < 0 && pageNumber >= TrackerBulkURLWrapper.this.mPages) {
                this.toIndex = -1;
                this.fromIndex = -1;
            } else {
                this.fromIndex = pageNumber * TrackerBulkURLWrapper.EVENTS_PER_PAGE;
                this.toIndex = Math.min(this.fromIndex + TrackerBulkURLWrapper.EVENTS_PER_PAGE, TrackerBulkURLWrapper.this.mEvents.size());
            }
        }

        public int elementsCount() {
            return this.toIndex - this.fromIndex;
        }

        public boolean isEmpty() {
            return this.fromIndex == -1 || elementsCount() == 0;
        }
    }
}
