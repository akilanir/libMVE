.class public Lorg/openintents/openpgp/OpenPgpMetadata;
.super Ljava/lang/Object;
.source "OpenPgpMetadata.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/openintents/openpgp/OpenPgpMetadata;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARCELABLE_VERSION:I = 0x2


# instance fields
.field charset:Ljava/lang/String;

.field filename:Ljava/lang/String;

.field mimeType:Ljava/lang/String;

.field modificationTime:J

.field originalSize:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 112
    new-instance v0, Lorg/openintents/openpgp/OpenPgpMetadata$1;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpMetadata$1;-><init>()V

    sput-object v0, Lorg/openintents/openpgp/OpenPgpMetadata;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJ)V
    .registers 7
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "modificationTime"    # J
    .param p5, "originalSize"    # J

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    .line 71
    iput-object p2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    .line 72
    iput-wide p3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    .line 73
    iput-wide p5, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    .line 74
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJLjava/lang/String;)V
    .registers 8
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "mimeType"    # Ljava/lang/String;
    .param p3, "modificationTime"    # J
    .param p5, "originalSize"    # J
    .param p7, "charset"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    .line 62
    iput-object p2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    .line 63
    iput-wide p3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    .line 64
    iput-wide p5, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    .line 65
    iput-object p7, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->charset:Ljava/lang/String;

    .line 66
    return-void
.end method

.method public constructor <init>(Lorg/openintents/openpgp/OpenPgpMetadata;)V
    .registers 4
    .param p1, "b"    # Lorg/openintents/openpgp/OpenPgpMetadata;

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    .line 78
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    .line 79
    iget-wide v0, p1, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    iput-wide v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    .line 80
    iget-wide v0, p1, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    iput-wide v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    .line 81
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 84
    const/4 v0, 0x0

    return v0
.end method

.method public getCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 53
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->charset:Ljava/lang/String;

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .registers 2

    .prologue
    .line 37
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .registers 2

    .prologue
    .line 41
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getModificationTime()J
    .registers 3

    .prologue
    .line 45
    iget-wide v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    return-wide v0
.end method

.method public getOriginalSize()J
    .registers 3

    .prologue
    .line 49
    iget-wide v0, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 140
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\nfilename: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "out":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nmimeType: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 142
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nmodificationTime: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 143
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\noriginalSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 144
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\ncharset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->charset:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 145
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 8
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 92
    const/4 v3, 0x2

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 96
    .local v1, "sizePosition":I
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 99
    .local v2, "startPosition":I
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->filename:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 100
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->mimeType:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 101
    iget-wide v3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->modificationTime:J

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 102
    iget-wide v3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->originalSize:J

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 104
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpMetadata;->charset:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 106
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 107
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 108
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 109
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 110
    return-void
.end method
