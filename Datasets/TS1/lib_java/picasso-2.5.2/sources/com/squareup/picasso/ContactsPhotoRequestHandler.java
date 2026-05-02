package com.squareup.picasso;

import android.annotation.TargetApi;
import android.content.ContentResolver;
import android.content.Context;
import android.content.UriMatcher;
import android.net.Uri;
import android.os.Build;
import android.provider.ContactsContract;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestHandler;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: picasso-2.5.2.jar:com/squareup/picasso/ContactsPhotoRequestHandler.class */
class ContactsPhotoRequestHandler extends RequestHandler {
    private static final int ID_LOOKUP = 1;
    private static final int ID_THUMBNAIL = 2;
    private static final int ID_CONTACT = 3;
    private static final int ID_DISPLAY_PHOTO = 4;
    private static final UriMatcher matcher = new UriMatcher(-1);
    private final Context context;

    static {
        matcher.addURI("com.android.contacts", "contacts/lookup/*/#", ID_LOOKUP);
        matcher.addURI("com.android.contacts", "contacts/lookup/*", ID_LOOKUP);
        matcher.addURI("com.android.contacts", "contacts/#/photo", ID_THUMBNAIL);
        matcher.addURI("com.android.contacts", "contacts/#", ID_CONTACT);
        matcher.addURI("com.android.contacts", "display_photo/#", ID_DISPLAY_PHOTO);
    }

    ContactsPhotoRequestHandler(Context context) {
        this.context = context;
    }

    @Override // com.squareup.picasso.RequestHandler
    public boolean canHandleRequest(Request data) {
        Uri uri = data.uri;
        return "content".equals(uri.getScheme()) && ContactsContract.Contacts.CONTENT_URI.getHost().equals(uri.getHost()) && matcher.match(data.uri) != -1;
    }

    @Override // com.squareup.picasso.RequestHandler
    public RequestHandler.Result load(Request request, int networkPolicy) throws IOException {
        InputStream is = getInputStream(request);
        if (is != null) {
            return new RequestHandler.Result(is, Picasso.LoadedFrom.DISK);
        }
        return null;
    }

    private InputStream getInputStream(Request data) throws IOException {
        ContentResolver contentResolver = this.context.getContentResolver();
        Uri uri = data.uri;
        switch (matcher.match(uri)) {
            case ID_LOOKUP /* 1 */:
                uri = ContactsContract.Contacts.lookupContact(contentResolver, uri);
                if (uri == null) {
                    return null;
                }
                break;
            case ID_THUMBNAIL /* 2 */:
            case ID_DISPLAY_PHOTO /* 4 */:
                return contentResolver.openInputStream(uri);
            case ID_CONTACT /* 3 */:
                break;
            default:
                throw new IllegalStateException("Invalid uri: " + uri);
        }
        if (Build.VERSION.SDK_INT < 14) {
            return ContactsContract.Contacts.openContactPhotoInputStream(contentResolver, uri);
        }
        return ContactPhotoStreamIcs.get(contentResolver, uri);
    }

    @TargetApi(14)
    /* loaded from: picasso-2.5.2.jar:com/squareup/picasso/ContactsPhotoRequestHandler$ContactPhotoStreamIcs.class */
    private static class ContactPhotoStreamIcs {
        private ContactPhotoStreamIcs() {
        }

        static InputStream get(ContentResolver contentResolver, Uri uri) {
            return ContactsContract.Contacts.openContactPhotoInputStream(contentResolver, uri, true);
        }
    }
}
