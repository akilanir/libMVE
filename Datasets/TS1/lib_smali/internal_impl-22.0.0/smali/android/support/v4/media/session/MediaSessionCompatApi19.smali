.class public Landroid/support/v4/media/session/MediaSessionCompatApi19;
.super Ljava/lang/Object;
.source "MediaSessionCompatApi19.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/media/session/MediaSessionCompatApi19$OnMetadataUpdateListener;
    }
.end annotation


# static fields
.field private static final METADATA_KEY_ALBUM_ART:Ljava/lang/String; = "android.media.metadata.ALBUM_ART"

.field private static final METADATA_KEY_ART:Ljava/lang/String; = "android.media.metadata.ART"

.field private static final METADATA_KEY_RATING:Ljava/lang/String; = "android.media.metadata.RATING"

.field private static final METADATA_KEY_USER_RATING:Ljava/lang/String; = "android.media.metadata.USER_RATING"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method

.method static addNewMetadata(Landroid/os/Bundle;Landroid/media/RemoteControlClient$MetadataEditor;)V
    .registers 6
    .param p0, "metadata"    # Landroid/os/Bundle;
    .param p1, "editor"    # Landroid/media/RemoteControlClient$MetadataEditor;

    .prologue
    const/16 v3, 0x64

    .line 52
    const-string v1, "android.media.metadata.RATING"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 53
    const/16 v1, 0x65

    const-string v2, "android.media.metadata.RATING"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/media/RemoteControlClient$MetadataEditor;->putObject(ILjava/lang/Object;)Landroid/media/MediaMetadataEditor;

    .line 56
    :cond_15
    const-string v1, "android.media.metadata.USER_RATING"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_29

    .line 57
    const v1, 0x10000001

    const-string v2, "android.media.metadata.USER_RATING"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/media/RemoteControlClient$MetadataEditor;->putObject(ILjava/lang/Object;)Landroid/media/MediaMetadataEditor;

    .line 60
    :cond_29
    const-string v1, "android.media.metadata.ART"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 61
    const-string v1, "android.media.metadata.ART"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 62
    .local v0, "art":Landroid/graphics/Bitmap;
    invoke-virtual {p1, v3, v0}, Landroid/media/RemoteControlClient$MetadataEditor;->putBitmap(ILandroid/graphics/Bitmap;)Landroid/media/RemoteControlClient$MetadataEditor;

    .line 68
    .end local v0    # "art":Landroid/graphics/Bitmap;
    :cond_3c
    :goto_3c
    return-void

    .line 63
    :cond_3d
    const-string v1, "android.media.metadata.ALBUM_ART"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 65
    const-string v1, "android.media.metadata.ALBUM_ART"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    .line 66
    .restart local v0    # "art":Landroid/graphics/Bitmap;
    invoke-virtual {p1, v3, v0}, Landroid/media/RemoteControlClient$MetadataEditor;->putBitmap(ILandroid/graphics/Bitmap;)Landroid/media/RemoteControlClient$MetadataEditor;

    goto :goto_3c
.end method

.method public static createMetadataUpdateListener(Landroid/support/v4/media/session/MediaSessionCompatApi14$Callback;)Ljava/lang/Object;
    .registers 2
    .param p0, "callback"    # Landroid/support/v4/media/session/MediaSessionCompatApi14$Callback;

    .prologue
    .line 32
    new-instance v0, Landroid/support/v4/media/session/MediaSessionCompatApi19$OnMetadataUpdateListener;

    invoke-direct {v0, p0}, Landroid/support/v4/media/session/MediaSessionCompatApi19$OnMetadataUpdateListener;-><init>(Landroid/support/v4/media/session/MediaSessionCompatApi14$Callback;)V

    return-object v0
.end method

.method public static setMetadata(Ljava/lang/Object;Landroid/os/Bundle;Z)V
    .registers 6
    .param p0, "rccObj"    # Ljava/lang/Object;
    .param p1, "metadata"    # Landroid/os/Bundle;
    .param p2, "supportRating"    # Z

    .prologue
    .line 36
    check-cast p0, Landroid/media/RemoteControlClient;

    .end local p0    # "rccObj":Ljava/lang/Object;
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroid/media/RemoteControlClient;->editMetadata(Z)Landroid/media/RemoteControlClient$MetadataEditor;

    move-result-object v0

    .line 38
    .local v0, "editor":Landroid/media/RemoteControlClient$MetadataEditor;
    invoke-static {p1, v0}, Landroid/support/v4/media/session/MediaSessionCompatApi14;->buildOldMetadata(Landroid/os/Bundle;Landroid/media/RemoteControlClient$MetadataEditor;)V

    .line 39
    invoke-static {p1, v0}, Landroid/support/v4/media/session/MediaSessionCompatApi19;->addNewMetadata(Landroid/os/Bundle;Landroid/media/RemoteControlClient$MetadataEditor;)V

    .line 40
    if-eqz p2, :cond_1b

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-le v1, v2, :cond_1b

    .line 41
    const v1, 0x10000001

    invoke-virtual {v0, v1}, Landroid/media/RemoteControlClient$MetadataEditor;->addEditableKey(I)V

    .line 43
    :cond_1b
    invoke-virtual {v0}, Landroid/media/RemoteControlClient$MetadataEditor;->apply()V

    .line 44
    return-void
.end method

.method public static setOnMetadataUpdateListener(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 2
    .param p0, "rccObj"    # Ljava/lang/Object;
    .param p1, "onMetadataUpdateObj"    # Ljava/lang/Object;

    .prologue
    .line 47
    check-cast p0, Landroid/media/RemoteControlClient;

    .end local p0    # "rccObj":Ljava/lang/Object;
    check-cast p1, Landroid/media/RemoteControlClient$OnMetadataUpdateListener;

    .end local p1    # "onMetadataUpdateObj":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/media/RemoteControlClient;->setMetadataUpdateListener(Landroid/media/RemoteControlClient$OnMetadataUpdateListener;)V

    .line 49
    return-void
.end method
