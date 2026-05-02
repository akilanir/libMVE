.class public Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;
.super Ljava/lang/Object;
.source "MediaFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/koushikdutta/ion/loader/MediaFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaFileType"
.end annotation


# instance fields
.field public final fileType:I

.field public final mimeType:Ljava/lang/String;


# direct methods
.method constructor <init>(ILjava/lang/String;)V
    .registers 3
    .param p1, "fileType"    # I
    .param p2, "mimeType"    # Ljava/lang/String;

    .prologue
    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    iput p1, p0, Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;->fileType:I

    .line 122
    iput-object p2, p0, Lcom/koushikdutta/ion/loader/MediaFile$MediaFileType;->mimeType:Ljava/lang/String;

    .line 123
    return-void
.end method
