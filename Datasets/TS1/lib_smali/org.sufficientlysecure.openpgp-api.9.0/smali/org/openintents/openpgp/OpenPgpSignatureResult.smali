.class public Lorg/openintents/openpgp/OpenPgpSignatureResult;
.super Ljava/lang/Object;
.source "OpenPgpSignatureResult.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lorg/openintents/openpgp/OpenPgpSignatureResult;",
            ">;"
        }
    .end annotation
.end field

.field public static final PARCELABLE_VERSION:I = 0x2

.field public static final RESULT_INVALID_INSECURE:I = 0x6

.field public static final RESULT_INVALID_KEY_EXPIRED:I = 0x5

.field public static final RESULT_INVALID_KEY_REVOKED:I = 0x4

.field public static final RESULT_INVALID_SIGNATURE:I = 0x0

.field public static final RESULT_KEY_MISSING:I = 0x2

.field public static final RESULT_NO_SIGNATURE:I = -0x1

.field public static final RESULT_VALID_CONFIRMED:I = 0x1

.field public static final RESULT_VALID_UNCONFIRMED:I = 0x3


# instance fields
.field keyId:J

.field primaryUserId:Ljava/lang/String;

.field result:I

.field signatureOnly:Z

.field userIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 153
    new-instance v0, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;

    invoke-direct {v0}, Lorg/openintents/openpgp/OpenPgpSignatureResult$1;-><init>()V

    sput-object v0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 105
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;ZJLjava/util/ArrayList;)V
    .registers 7
    .param p1, "signatureStatus"    # I
    .param p2, "signatureUserId"    # Ljava/lang/String;
    .param p3, "signatureOnly"    # Z
    .param p4, "keyId"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "ZJ",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 108
    .local p6, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    .line 110
    iput-boolean p3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 111
    iput-object p2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 112
    iput-wide p4, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 113
    iput-object p6, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 114
    return-void
.end method

.method public constructor <init>(Lorg/openintents/openpgp/OpenPgpSignatureResult;)V
    .registers 4
    .param p1, "b"    # Lorg/openintents/openpgp/OpenPgpSignatureResult;

    .prologue
    .line 116
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 117
    iget v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    iput v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    .line 118
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 119
    iget-boolean v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    iput-boolean v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 120
    iget-wide v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    iput-wide v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 121
    iget-object v0, p1, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    iput-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 122
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 125
    const/4 v0, 0x0

    return v0
.end method

.method public getKeyId()J
    .registers 3

    .prologue
    .line 96
    iget-wide v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    return-wide v0
.end method

.method public getPrimaryUserId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()I
    .registers 2

    .prologue
    .line 58
    iget v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    return v0
.end method

.method public getUserIds()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    return-object v0
.end method

.method public isSignatureOnly()Z
    .registers 2

    .prologue
    .line 69
    iget-boolean v0, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    return v0
.end method

.method public setKeyId(J)V
    .registers 3
    .param p1, "keyId"    # J

    .prologue
    .line 100
    iput-wide p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    .line 101
    return-void
.end method

.method public setPrimaryUserId(Ljava/lang/String;)V
    .registers 2
    .param p1, "primaryUserId"    # Ljava/lang/String;

    .prologue
    .line 84
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    .line 85
    return-void
.end method

.method public setResult(I)V
    .registers 2
    .param p1, "result"    # I

    .prologue
    .line 62
    iput p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    .line 63
    return-void
.end method

.method public setSignatureOnly(Z)V
    .registers 2
    .param p1, "signatureOnly"    # Z

    .prologue
    .line 76
    iput-boolean p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    .line 77
    return-void
.end method

.method public setUserIds(Ljava/util/ArrayList;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 92
    .local p1, "userIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iput-object p1, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    .line 93
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 180
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\nresult: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "out":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nprimaryUserId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 182
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nuserIds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 183
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nsignatureOnly: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 184
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nkeyId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    invoke-static {v2, v3}, Lorg/openintents/openpgp/util/OpenPgpUtils;->convertKeyIdToHex(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 185
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 8
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v3, 0x0

    .line 133
    const/4 v4, 0x2

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 136
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 137
    .local v1, "sizePosition":I
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 138
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 140
    .local v2, "startPosition":I
    iget v4, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->result:I

    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    iget-boolean v4, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->signatureOnly:Z

    if-eqz v4, :cond_1a

    const/4 v3, 0x1

    :cond_1a
    int-to-byte v3, v3

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeByte(B)V

    .line 142
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->primaryUserId:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 143
    iget-wide v3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->keyId:J

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 145
    iget-object v3, p0, Lorg/openintents/openpgp/OpenPgpSignatureResult;->userIds:Ljava/util/ArrayList;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeStringList(Ljava/util/List;)V

    .line 147
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 148
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 149
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 150
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 151
    return-void
.end method
