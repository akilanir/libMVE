.class public Lde/cketti/shareintentbuilder/ShareIntentBuilder;
.super Ljava/lang/Object;
.source "ShareIntentBuilder.java"


# static fields
.field public static final EXTRA_CALLING_ACTIVITY:Ljava/lang/String; = "android.support.v4.app.EXTRA_CALLING_ACTIVITY"

.field public static final EXTRA_CALLING_PACKAGE:Ljava/lang/String; = "android.support.v4.app.EXTRA_CALLING_PACKAGE"


# instance fields
.field private final context:Landroid/content/Context;

.field private ignoreSpecification:Z

.field final mimeTypeAggregator:Lde/cketti/shareintentbuilder/MimeTypeAggregator;

.field private final recipientsBcc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final recipientsCc:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final recipientsTo:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final streams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private subject:Ljava/lang/String;

.field final texts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Lde/cketti/shareintentbuilder/MimeTypeAggregator;

    invoke-direct {v0}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;-><init>()V

    iput-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->mimeTypeAggregator:Lde/cketti/shareintentbuilder/MimeTypeAggregator;

    .line 56
    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->ignoreSpecification:Z

    .line 57
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->streams:Ljava/util/List;

    .line 60
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsTo:Ljava/util/List;

    .line 61
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsCc:Ljava/util/List;

    .line 62
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsBcc:Ljava/util/List;

    .line 65
    iput-object p1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    .line 66
    return-void
.end method

.method private addActivityFlags(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 302
    const/high16 v0, 0x80000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 303
    return-void
.end method

.method private addCallingActivityExtraIfAvailable(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 295
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_13

    .line 296
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    .line 297
    .local v0, "activity":Landroid/app/Activity;
    const-string v1, "android.support.v4.app.EXTRA_CALLING_ACTIVITY"

    invoke-virtual {v0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 299
    .end local v0    # "activity":Landroid/app/Activity;
    :cond_13
    return-void
.end method

.method private addCallingPackageExtra(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 291
    const-string v0, "android.support.v4.app.EXTRA_CALLING_PACKAGE"

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 292
    return-void
.end method

.method private addEmailRecipients(Landroid/content/Intent;Ljava/lang/String;Ljava/util/List;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "extraKey"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 312
    .local p3, "to":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 317
    :goto_6
    return-void

    .line 316
    :cond_7
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-interface {p3, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_6
.end method

.method private addStream(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 4
    .param p1, "stream"    # Landroid/net/Uri;
    .param p2, "type"    # Ljava/lang/String;

    .prologue
    .line 132
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->mimeTypeAggregator:Lde/cketti/shareintentbuilder/MimeTypeAggregator;

    invoke-virtual {v0, p2}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->add(Ljava/lang/String;)V

    .line 133
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->streams:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    return-void
.end method

.method private addSubject(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 306
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->subject:Ljava/lang/String;

    if-eqz v0, :cond_b

    .line 307
    const-string v0, "android.intent.extra.SUBJECT"

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->subject:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 309
    :cond_b
    return-void
.end method

.method private buildShareIntentWithStream(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    .line 258
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->mimeTypeAggregator:Lde/cketti/shareintentbuilder/MimeTypeAggregator;

    invoke-virtual {v1}, Lde/cketti/shareintentbuilder/MimeTypeAggregator;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 260
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->streams:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v0, :cond_18

    .line 261
    .local v0, "hasMoreThanOneStream":Z
    :goto_12
    if-eqz v0, :cond_1a

    .line 262
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->setMultipleStreams(Landroid/content/Intent;)V

    .line 266
    :goto_17
    return-void

    .line 260
    .end local v0    # "hasMoreThanOneStream":Z
    :cond_18
    const/4 v0, 0x0

    goto :goto_12

    .line 264
    .restart local v0    # "hasMoreThanOneStream":Z
    :cond_1a
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->setSingleStream(Landroid/content/Intent;)V

    goto :goto_17
.end method

.method private buildShareIntentWithText(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x1

    .line 232
    const-string v1, "text/plain"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 234
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-le v1, v0, :cond_14

    .line 235
    .local v0, "hasMoreThanOneText":Z
    :goto_e
    if-eqz v0, :cond_16

    .line 236
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->setMultipleText(Landroid/content/Intent;)V

    .line 240
    :goto_13
    return-void

    .line 234
    .end local v0    # "hasMoreThanOneText":Z
    :cond_14
    const/4 v0, 0x0

    goto :goto_e

    .line 238
    .restart local v0    # "hasMoreThanOneText":Z
    :cond_16
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->setSingleText(Landroid/content/Intent;)V

    goto :goto_13
.end method

.method private buildShareIntentWithTextAndStream(Landroid/content/Intent;)V
    .registers 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 269
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->buildShareIntentWithStream(Landroid/content/Intent;)V

    .line 270
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->setSingleTextExtra(Landroid/content/Intent;)V

    .line 271
    return-void
.end method

.method private static checkContentScheme(Landroid/net/Uri;)V
    .registers 3
    .param p0, "uri"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 320
    const-string v0, "content"

    invoke-virtual {p0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_14

    .line 321
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument must be a content:// URI"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 323
    :cond_14
    return-void
.end method

.method protected static checkNotNull(Ljava/lang/Object;)V
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 326
    if-nez p0, :cond_a

    .line 327
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Argument may not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 329
    :cond_a
    return-void
.end method

.method public static from(Landroid/content/Context;)Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;
    .registers 3
    .param p0, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 78
    invoke-static {p0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 80
    new-instance v0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;

    invoke-direct {v0, p0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;-><init>(Landroid/content/Context;)V

    .line 81
    .local v0, "builder":Lde/cketti/shareintentbuilder/ShareIntentBuilder;
    new-instance v1, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;

    invoke-direct {v1, v0}, Lde/cketti/shareintentbuilder/ShareIntentNoBuilder;-><init>(Lde/cketti/shareintentbuilder/ShareIntentBuilder;)V

    return-object v1
.end method

.method private getTypeViaContentResolver(Landroid/net/Uri;)Ljava/lang/String;
    .registers 5
    .param p1, "stream"    # Landroid/net/Uri;

    .prologue
    .line 124
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->getType(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 125
    .local v0, "type":Ljava/lang/String;
    if-nez v0, :cond_14

    .line 126
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Content provider needs to provide a type"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_14
    return-object v0
.end method

.method private setMultipleStreams(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 279
    const-string v0, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 280
    const-string v0, "android.intent.extra.STREAM"

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->streams:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 281
    return-void
.end method

.method private setMultipleText(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 253
    const-string v0, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 254
    const-string v0, "android.intent.extra.TEXT"

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putStringArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 255
    return-void
.end method

.method private setSingleStream(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 274
    const-string v0, "android.intent.action.SEND"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 275
    const-string v1, "android.intent.extra.STREAM"

    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->streams:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 276
    return-void
.end method

.method private setSingleText(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 243
    const-string v0, "android.intent.action.SEND"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 244
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->setSingleTextExtra(Landroid/content/Intent;)V

    .line 245
    return-void
.end method

.method private setSingleTextExtra(Landroid/content/Intent;)V
    .registers 5
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 248
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 249
    .local v0, "text":Ljava/lang/String;
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 250
    return-void
.end method

.method private shareWithOptionalTitle(Ljava/lang/CharSequence;)V
    .registers 4
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 217
    invoke-virtual {p0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->build()Landroid/content/Intent;

    move-result-object v1

    .line 218
    .local v1, "shareIntent":Landroid/content/Intent;
    invoke-static {v1, p1}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    .line 220
    .local v0, "chooserIntent":Landroid/content/Intent;
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->startActivity(Landroid/content/Intent;)V

    .line 221
    return-void
.end method

.method private startActivity(Landroid/content/Intent;)V
    .registers 3
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 224
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-nez v0, :cond_b

    .line 225
    const/high16 v0, 0x10000000

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 228
    :cond_b
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 229
    return-void
.end method


# virtual methods
.method addOptionalExtras(Landroid/content/Intent;)V
    .registers 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 284
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addSubject(Landroid/content/Intent;)V

    .line 285
    const-string v0, "android.intent.extra.EMAIL"

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsTo:Ljava/util/List;

    invoke-direct {p0, p1, v0, v1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addEmailRecipients(Landroid/content/Intent;Ljava/lang/String;Ljava/util/List;)V

    .line 286
    const-string v0, "android.intent.extra.CC"

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsCc:Ljava/util/List;

    invoke-direct {p0, p1, v0, v1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addEmailRecipients(Landroid/content/Intent;Ljava/lang/String;Ljava/util/List;)V

    .line 287
    const-string v0, "android.intent.extra.BCC"

    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsBcc:Ljava/util/List;

    invoke-direct {p0, p1, v0, v1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addEmailRecipients(Landroid/content/Intent;Ljava/lang/String;Ljava/util/List;)V

    .line 288
    return-void
.end method

.method bcc(Ljava/lang/String;)V
    .registers 3
    .param p1, "email"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 173
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 175
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsBcc:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    return-void
.end method

.method bcc(Ljava/util/Collection;)V
    .registers 5
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 179
    .local p1, "emails":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 180
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 181
    .local v0, "email":Ljava/lang/String;
    invoke-static {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_7

    .line 184
    .end local v0    # "email":Ljava/lang/String;
    :cond_17
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsBcc:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 185
    return-void
.end method

.method build()Landroid/content/Intent;
    .registers 4

    .prologue
    .line 188
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 189
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 190
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->buildShareIntentWithStream(Landroid/content/Intent;)V

    .line 199
    :goto_10
    invoke-virtual {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addOptionalExtras(Landroid/content/Intent;)V

    .line 200
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addCallingPackageExtra(Landroid/content/Intent;)V

    .line 201
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addCallingActivityExtraIfAvailable(Landroid/content/Intent;)V

    .line 202
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addActivityFlags(Landroid/content/Intent;)V

    .line 204
    return-object v0

    .line 191
    :cond_1d
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->streams:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 192
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->buildShareIntentWithText(Landroid/content/Intent;)V

    goto :goto_10

    .line 193
    :cond_29
    iget-boolean v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->ignoreSpecification:Z

    if-eqz v1, :cond_31

    .line 194
    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->buildShareIntentWithTextAndStream(Landroid/content/Intent;)V

    goto :goto_10

    .line 196
    :cond_31
    new-instance v1, Ljava/lang/AssertionError;

    const-string v2, "Text and stream supplied despite \'ignoreSpecification\' being false"

    invoke-direct {v1, v2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method

.method cc(Ljava/lang/String;)V
    .registers 3
    .param p1, "email"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 158
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 160
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsCc:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 161
    return-void
.end method

.method cc(Ljava/util/Collection;)V
    .registers 5
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 164
    .local p1, "emails":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 165
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 166
    .local v0, "email":Ljava/lang/String;
    invoke-static {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_7

    .line 169
    .end local v0    # "email":Ljava/lang/String;
    :cond_17
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsCc:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 170
    return-void
.end method

.method ignoreSpecification()V
    .registers 2

    .prologue
    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->ignoreSpecification:Z

    .line 86
    return-void
.end method

.method share()V
    .registers 2

    .prologue
    .line 208
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->shareWithOptionalTitle(Ljava/lang/CharSequence;)V

    .line 209
    return-void
.end method

.method share(Ljava/lang/CharSequence;)V
    .registers 2
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 212
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 213
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->shareWithOptionalTitle(Ljava/lang/CharSequence;)V

    .line 214
    return-void
.end method

.method stream(Landroid/net/Uri;)V
    .registers 4
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 104
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 105
    iget-boolean v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->ignoreSpecification:Z

    if-nez v1, :cond_a

    .line 106
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkContentScheme(Landroid/net/Uri;)V

    .line 109
    :cond_a
    invoke-direct {p0, p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->getTypeViaContentResolver(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "type":Ljava/lang/String;
    invoke-direct {p0, p1, v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addStream(Landroid/net/Uri;Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method stream(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 4
    .param p1, "stream"    # Landroid/net/Uri;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "type"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 115
    invoke-static {p2}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 116
    iget-boolean v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->ignoreSpecification:Z

    if-nez v0, :cond_d

    .line 117
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkContentScheme(Landroid/net/Uri;)V

    .line 120
    :cond_d
    invoke-direct {p0, p1, p2}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->addStream(Landroid/net/Uri;Ljava/lang/String;)V

    .line 121
    return-void
.end method

.method subject(Ljava/lang/String;)V
    .registers 2
    .param p1, "subject"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 137
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 139
    iput-object p1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->subject:Ljava/lang/String;

    .line 140
    return-void
.end method

.method text(Ljava/lang/String;)V
    .registers 3
    .param p1, "text"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 89
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 91
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 92
    return-void
.end method

.method text(Ljava/util/Collection;)V
    .registers 5
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "texts":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 96
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 97
    .local v0, "text":Ljava/lang/String;
    invoke-static {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_7

    .line 100
    .end local v0    # "text":Ljava/lang/String;
    :cond_17
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->texts:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 101
    return-void
.end method

.method to(Ljava/lang/String;)V
    .registers 3
    .param p1, "email"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 143
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 145
    iget-object v0, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsTo:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 146
    return-void
.end method

.method to(Ljava/util/Collection;)V
    .registers 5
    .param p1    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 149
    .local p1, "emails":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p1}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    .line 150
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 151
    .local v0, "email":Ljava/lang/String;
    invoke-static {v0}, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->checkNotNull(Ljava/lang/Object;)V

    goto :goto_7

    .line 154
    .end local v0    # "email":Ljava/lang/String;
    :cond_17
    iget-object v1, p0, Lde/cketti/shareintentbuilder/ShareIntentBuilder;->recipientsTo:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 155
    return-void
.end method
