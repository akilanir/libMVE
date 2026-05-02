package de.cketti.shareintentbuilder;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* loaded from: de.cketti.share.share-intent-builder.0.0.2.jar:de/cketti/shareintentbuilder/ShareIntentBuilder.class */
public class ShareIntentBuilder {
    public static final String EXTRA_CALLING_PACKAGE = "android.support.v4.app.EXTRA_CALLING_PACKAGE";
    public static final String EXTRA_CALLING_ACTIVITY = "android.support.v4.app.EXTRA_CALLING_ACTIVITY";
    private final Context context;
    private String subject;
    final MimeTypeAggregator mimeTypeAggregator = new MimeTypeAggregator();
    private boolean ignoreSpecification = false;
    final List<String> texts = new ArrayList();
    final List<Uri> streams = new ArrayList();
    private final List<String> recipientsTo = new ArrayList();
    private final List<String> recipientsCc = new ArrayList();
    private final List<String> recipientsBcc = new ArrayList();

    private ShareIntentBuilder(Context context) {
        this.context = context;
    }

    public static ShareIntentNoBuilder from(@NonNull Context context) {
        checkNotNull(context);
        ShareIntentBuilder builder = new ShareIntentBuilder(context);
        return new ShareIntentNoBuilder(builder);
    }

    void ignoreSpecification() {
        this.ignoreSpecification = true;
    }

    void text(@NonNull String text) {
        checkNotNull(text);
        this.texts.add(text);
    }

    void text(@NonNull Collection<String> texts) {
        checkNotNull(texts);
        for (String text : texts) {
            checkNotNull(text);
        }
        this.texts.addAll(texts);
    }

    void stream(@NonNull Uri stream) {
        checkNotNull(stream);
        if (!this.ignoreSpecification) {
            checkContentScheme(stream);
        }
        String type = getTypeViaContentResolver(stream);
        addStream(stream, type);
    }

    void stream(@NonNull Uri stream, @NonNull String type) {
        checkNotNull(stream);
        checkNotNull(type);
        if (!this.ignoreSpecification) {
            checkContentScheme(stream);
        }
        addStream(stream, type);
    }

    private String getTypeViaContentResolver(Uri stream) {
        String type = this.context.getContentResolver().getType(stream);
        if (type == null) {
            throw new IllegalStateException("Content provider needs to provide a type");
        }
        return type;
    }

    private void addStream(Uri stream, String type) {
        this.mimeTypeAggregator.add(type);
        this.streams.add(stream);
    }

    void subject(@NonNull String subject) {
        checkNotNull(subject);
        this.subject = subject;
    }

    void to(@NonNull String email) {
        checkNotNull(email);
        this.recipientsTo.add(email);
    }

    void to(@NonNull Collection<String> emails) {
        checkNotNull(emails);
        for (String email : emails) {
            checkNotNull(email);
        }
        this.recipientsTo.addAll(emails);
    }

    void cc(@NonNull String email) {
        checkNotNull(email);
        this.recipientsCc.add(email);
    }

    void cc(@NonNull Collection<String> emails) {
        checkNotNull(emails);
        for (String email : emails) {
            checkNotNull(email);
        }
        this.recipientsCc.addAll(emails);
    }

    void bcc(@NonNull String email) {
        checkNotNull(email);
        this.recipientsBcc.add(email);
    }

    void bcc(@NonNull Collection<String> emails) {
        checkNotNull(emails);
        for (String email : emails) {
            checkNotNull(email);
        }
        this.recipientsBcc.addAll(emails);
    }

    Intent build() {
        Intent intent = new Intent();
        if (this.texts.isEmpty()) {
            buildShareIntentWithStream(intent);
        } else if (this.streams.isEmpty()) {
            buildShareIntentWithText(intent);
        } else if (this.ignoreSpecification) {
            buildShareIntentWithTextAndStream(intent);
        } else {
            throw new AssertionError("Text and stream supplied despite 'ignoreSpecification' being false");
        }
        addOptionalExtras(intent);
        addCallingPackageExtra(intent);
        addCallingActivityExtraIfAvailable(intent);
        addActivityFlags(intent);
        return intent;
    }

    void share() {
        shareWithOptionalTitle(null);
    }

    void share(CharSequence title) {
        checkNotNull(title);
        shareWithOptionalTitle(title);
    }

    private void shareWithOptionalTitle(CharSequence title) {
        Intent shareIntent = build();
        Intent chooserIntent = Intent.createChooser(shareIntent, title);
        startActivity(chooserIntent);
    }

    private void startActivity(Intent intent) {
        if (!(this.context instanceof Activity)) {
            intent.addFlags(268435456);
        }
        this.context.startActivity(intent);
    }

    private void buildShareIntentWithText(Intent intent) {
        intent.setType("text/plain");
        boolean hasMoreThanOneText = this.texts.size() > 1;
        if (hasMoreThanOneText) {
            setMultipleText(intent);
        } else {
            setSingleText(intent);
        }
    }

    private void setSingleText(Intent intent) {
        intent.setAction("android.intent.action.SEND");
        setSingleTextExtra(intent);
    }

    private void setSingleTextExtra(Intent intent) {
        String text = this.texts.get(0);
        intent.putExtra("android.intent.extra.TEXT", text);
    }

    private void setMultipleText(Intent intent) {
        intent.setAction("android.intent.action.SEND_MULTIPLE");
        intent.putStringArrayListExtra("android.intent.extra.TEXT", new ArrayList<>(this.texts));
    }

    private void buildShareIntentWithStream(Intent intent) {
        intent.setType(this.mimeTypeAggregator.getType());
        boolean hasMoreThanOneStream = this.streams.size() > 1;
        if (hasMoreThanOneStream) {
            setMultipleStreams(intent);
        } else {
            setSingleStream(intent);
        }
    }

    private void buildShareIntentWithTextAndStream(Intent intent) {
        buildShareIntentWithStream(intent);
        setSingleTextExtra(intent);
    }

    private void setSingleStream(Intent intent) {
        intent.setAction("android.intent.action.SEND");
        intent.putExtra("android.intent.extra.STREAM", this.streams.get(0));
    }

    private void setMultipleStreams(Intent intent) {
        intent.setAction("android.intent.action.SEND_MULTIPLE");
        intent.putParcelableArrayListExtra("android.intent.extra.STREAM", new ArrayList<>(this.streams));
    }

    void addOptionalExtras(Intent intent) {
        addSubject(intent);
        addEmailRecipients(intent, "android.intent.extra.EMAIL", this.recipientsTo);
        addEmailRecipients(intent, "android.intent.extra.CC", this.recipientsCc);
        addEmailRecipients(intent, "android.intent.extra.BCC", this.recipientsBcc);
    }

    private void addCallingPackageExtra(Intent intent) {
        intent.putExtra(EXTRA_CALLING_PACKAGE, this.context.getPackageName());
    }

    private void addCallingActivityExtraIfAvailable(Intent intent) {
        if (this.context instanceof Activity) {
            Activity activity = (Activity) this.context;
            intent.putExtra(EXTRA_CALLING_ACTIVITY, activity.getComponentName());
        }
    }

    private void addActivityFlags(Intent intent) {
        intent.addFlags(524288);
    }

    private void addSubject(Intent intent) {
        if (this.subject != null) {
            intent.putExtra("android.intent.extra.SUBJECT", this.subject);
        }
    }

    private void addEmailRecipients(Intent intent, String extraKey, List<String> to) {
        if (to.isEmpty()) {
            return;
        }
        intent.putExtra(extraKey, (String[]) to.toArray(new String[to.size()]));
    }

    private static void checkContentScheme(@NonNull Uri uri) {
        if (!"content".equals(uri.getScheme())) {
            throw new IllegalArgumentException("Argument must be a content:// URI");
        }
    }

    protected static void checkNotNull(Object obj) {
        if (obj == null) {
            throw new IllegalArgumentException("Argument may not be null");
        }
    }
}
