.class public Lcom/google/android/apps/muzei/api/Artwork;
.super Ljava/lang/Object;
.source "Artwork.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/apps/muzei/api/Artwork$1;,
        Lcom/google/android/apps/muzei/api/Artwork$Builder;
    }
.end annotation


# static fields
.field private static final KEY_BYLINE:Ljava/lang/String; = "byline"

.field private static final KEY_DETAILS_URI:Ljava/lang/String; = "detailsUri"

.field private static final KEY_IMAGE_URI:Ljava/lang/String; = "imageUri"

.field private static final KEY_TITLE:Ljava/lang/String; = "title"

.field private static final KEY_TOKEN:Ljava/lang/String; = "token"

.field private static final KEY_VIEW_INTENT:Ljava/lang/String; = "viewIntent"


# instance fields
.field private mByline:Ljava/lang/String;

.field private mImageUri:Landroid/net/Uri;

.field private mTitle:Ljava/lang/String;

.field private mToken:Ljava/lang/String;

.field private mViewIntent:Landroid/content/Intent;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    return-void
.end method

.method synthetic constructor <init>(Lcom/google/android/apps/muzei/api/Artwork$1;)V
    .registers 2
    .param p1, "x0"    # Lcom/google/android/apps/muzei/api/Artwork$1;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/google/android/apps/muzei/api/Artwork;-><init>()V

    return-void
.end method

.method static synthetic access$102(Lcom/google/android/apps/muzei/api/Artwork;Landroid/net/Uri;)Landroid/net/Uri;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/Artwork;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    return-object p1
.end method

.method static synthetic access$202(Lcom/google/android/apps/muzei/api/Artwork;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/Artwork;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/google/android/apps/muzei/api/Artwork;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/Artwork;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mByline:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$402(Lcom/google/android/apps/muzei/api/Artwork;Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/Artwork;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mToken:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$502(Lcom/google/android/apps/muzei/api/Artwork;Landroid/content/Intent;)Landroid/content/Intent;
    .registers 2
    .param p0, "x0"    # Lcom/google/android/apps/muzei/api/Artwork;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    return-object p1
.end method

.method public static fromBundle(Landroid/os/Bundle;)Lcom/google/android/apps/muzei/api/Artwork;
    .registers 6
    .param p0, "bundle"    # Landroid/os/Bundle;

    .prologue
    .line 221
    new-instance v3, Lcom/google/android/apps/muzei/api/Artwork$Builder;

    invoke-direct {v3}, Lcom/google/android/apps/muzei/api/Artwork$Builder;-><init>()V

    const-string v4, "title"

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->title(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    move-result-object v3

    const-string v4, "byline"

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->byline(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    move-result-object v3

    const-string v4, "token"

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->token(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    move-result-object v0

    .line 226
    .local v0, "builder":Lcom/google/android/apps/muzei/api/Artwork$Builder;
    const-string v3, "imageUri"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 227
    .local v1, "imageUri":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_36

    .line 228
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->imageUri(Landroid/net/Uri;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    .line 232
    :cond_36
    :try_start_36
    const-string v3, "viewIntent"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 233
    .local v2, "viewIntent":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4a

    .line 234
    const/4 v3, 0x1

    invoke-static {v2, v3}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->viewIntent(Landroid/content/Intent;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    :try_end_4a
    .catch Ljava/net/URISyntaxException; {:try_start_36 .. :try_end_4a} :catch_4f

    .line 239
    .end local v2    # "viewIntent":Ljava/lang/String;
    :cond_4a
    :goto_4a
    invoke-virtual {v0}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->build()Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v3

    return-object v3

    .line 236
    :catch_4f
    move-exception v3

    goto :goto_4a
.end method

.method public static fromCursor(Landroid/database/Cursor;)Lcom/google/android/apps/muzei/api/Artwork;
    .registers 10
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v8, -0x1

    .line 306
    new-instance v0, Lcom/google/android/apps/muzei/api/Artwork$Builder;

    invoke-direct {v0}, Lcom/google/android/apps/muzei/api/Artwork$Builder;-><init>()V

    .line 307
    .local v0, "builder":Lcom/google/android/apps/muzei/api/Artwork$Builder;
    const-string v7, "imageUri"

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    .line 308
    .local v2, "imageUriColumnIndex":I
    if-eq v2, v8, :cond_19

    .line 309
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->imageUri(Landroid/net/Uri;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    .line 311
    :cond_19
    const-string v7, "title"

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 312
    .local v3, "titleColumnIndex":I
    if-eq v3, v8, :cond_28

    .line 313
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->title(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    .line 315
    :cond_28
    const-string v7, "byline"

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    .line 316
    .local v1, "bylineColumnIndex":I
    if-eq v1, v8, :cond_37

    .line 317
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->byline(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    .line 319
    :cond_37
    const-string v7, "token"

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    .line 320
    .local v4, "tokenColumnIndex":I
    if-eq v4, v8, :cond_46

    .line 321
    invoke-interface {p0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->token(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    .line 323
    :cond_46
    const-string v7, "viewIntent"

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    .line 324
    .local v6, "viewIntentColumnIndex":I
    if-eq v6, v8, :cond_60

    .line 326
    :try_start_4e
    invoke-interface {p0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 327
    .local v5, "viewIntent":Ljava/lang/String;
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_60

    .line 328
    const/4 v7, 0x1

    invoke-static {v5, v7}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v0, v7}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->viewIntent(Landroid/content/Intent;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    :try_end_60
    .catch Ljava/net/URISyntaxException; {:try_start_4e .. :try_end_60} :catch_65

    .line 333
    .end local v5    # "viewIntent":Ljava/lang/String;
    :cond_60
    :goto_60
    invoke-virtual {v0}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->build()Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v7

    return-object v7

    .line 330
    :catch_65
    move-exception v7

    goto :goto_60
.end method

.method public static fromJson(Lorg/json/JSONObject;)Lcom/google/android/apps/muzei/api/Artwork;
    .registers 8
    .param p0, "jsonObject"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 260
    new-instance v4, Lcom/google/android/apps/muzei/api/Artwork$Builder;

    invoke-direct {v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;-><init>()V

    const-string v5, "title"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->title(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    move-result-object v4

    const-string v5, "byline"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->byline(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    move-result-object v4

    const-string v5, "token"

    invoke-virtual {p0, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->token(Ljava/lang/String;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    move-result-object v0

    .line 265
    .local v0, "builder":Lcom/google/android/apps/muzei/api/Artwork$Builder;
    const-string v4, "imageUri"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 266
    .local v2, "imageUri":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_36

    .line 267
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->imageUri(Landroid/net/Uri;)Lcom/google/android/apps/muzei/api/Artwork$Builder;

    .line 271
    :cond_36
    :try_start_36
    const-string v4, "viewIntent"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 272
    .local v3, "viewIntent":Ljava/lang/String;
    const-string v4, "detailsUri"

    invoke-virtual {p0, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 273
    .local v1, "detailsUri":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_55

    .line 274
    const/4 v4, 0x1

    invoke-static {v3, v4}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->viewIntent(Landroid/content/Intent;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    :try_end_50
    .catch Ljava/net/URISyntaxException; {:try_start_36 .. :try_end_50} :catch_6a

    .line 281
    .end local v1    # "detailsUri":Ljava/lang/String;
    .end local v3    # "viewIntent":Ljava/lang/String;
    :cond_50
    :goto_50
    invoke-virtual {v0}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->build()Lcom/google/android/apps/muzei/api/Artwork;

    move-result-object v4

    return-object v4

    .line 275
    .restart local v1    # "detailsUri":Ljava/lang/String;
    .restart local v3    # "viewIntent":Ljava/lang/String;
    :cond_55
    :try_start_55
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_50

    .line 276
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.intent.action.VIEW"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v4}, Lcom/google/android/apps/muzei/api/Artwork$Builder;->viewIntent(Landroid/content/Intent;)Lcom/google/android/apps/muzei/api/Artwork$Builder;
    :try_end_69
    .catch Ljava/net/URISyntaxException; {:try_start_55 .. :try_end_69} :catch_6a

    goto :goto_50

    .line 278
    .end local v1    # "detailsUri":Ljava/lang/String;
    .end local v3    # "viewIntent":Ljava/lang/String;
    :catch_6a
    move-exception v4

    goto :goto_50
.end method


# virtual methods
.method public getByline()Ljava/lang/String;
    .registers 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork;->mByline:Ljava/lang/String;

    return-object v0
.end method

.method public getImageUri()Landroid/net/Uri;
    .registers 2

    .prologue
    .line 62
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .registers 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getToken()Ljava/lang/String;
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork;->mToken:Ljava/lang/String;

    return-object v0
.end method

.method public getViewIntent()Landroid/content/Intent;
    .registers 2

    .prologue
    .line 101
    iget-object v0, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    return-object v0
.end method

.method public toBundle()Landroid/os/Bundle;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 207
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 208
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v3, "imageUri"

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    if-eqz v1, :cond_3b

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_12
    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    const-string v1, "title"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 210
    const-string v1, "byline"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mByline:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    const-string v1, "token"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    const-string v1, "viewIntent"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    if-eqz v3, :cond_37

    iget-object v2, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v2

    :cond_37
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 214
    return-object v0

    :cond_3b
    move-object v1, v2

    .line 208
    goto :goto_12
.end method

.method public toContentValues()Landroid/content/ContentValues;
    .registers 5

    .prologue
    const/4 v2, 0x0

    .line 288
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 289
    .local v0, "values":Landroid/content/ContentValues;
    const-string v3, "imageUri"

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    if-eqz v1, :cond_3b

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_12
    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 291
    const-string v1, "title"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v1, "byline"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mByline:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    const-string v1, "token"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 294
    const-string v1, "viewIntent"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    if-eqz v3, :cond_37

    iget-object v2, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v2

    :cond_37
    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 296
    return-object v0

    :cond_3b
    move-object v1, v2

    .line 289
    goto :goto_12
.end method

.method public toJson()Lorg/json/JSONObject;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 246
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 247
    .local v0, "jsonObject":Lorg/json/JSONObject;
    const-string v3, "imageUri"

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    if-eqz v1, :cond_3b

    iget-object v1, p0, Lcom/google/android/apps/muzei/api/Artwork;->mImageUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_12
    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 248
    const-string v1, "title"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 249
    const-string v1, "byline"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mByline:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 250
    const-string v1, "token"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mToken:Ljava/lang/String;

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 251
    const-string v1, "viewIntent"

    iget-object v3, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    if-eqz v3, :cond_37

    iget-object v2, p0, Lcom/google/android/apps/muzei/api/Artwork;->mViewIntent:Landroid/content/Intent;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    move-result-object v2

    :cond_37
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    return-object v0

    :cond_3b
    move-object v1, v2

    .line 247
    goto :goto_12
.end method
