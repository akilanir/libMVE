.class public Lcyanogenmod/app/StatusBarPanelCustomTile;
.super Ljava/lang/Object;
.source "StatusBarPanelCustomTile.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcyanogenmod/app/StatusBarPanelCustomTile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final customTile:Lcyanogenmod/app/CustomTile;

.field private final id:I

.field private final initialPid:I

.field private final key:Ljava/lang/String;

.field private final opPkg:Ljava/lang/String;

.field private final pkg:Ljava/lang/String;

.field private final postTime:J

.field private final tag:Ljava/lang/String;

.field private final uid:I

.field private final user:Landroid/os/UserHandle;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 124
    new-instance v0, Lcyanogenmod/app/StatusBarPanelCustomTile$1;

    invoke-direct {v0}, Lcyanogenmod/app/StatusBarPanelCustomTile$1;-><init>()V

    sput-object v0, Lcyanogenmod/app/StatusBarPanelCustomTile;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 16
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 71
    .local v1, "parcelableVersion":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 72
    .local v0, "parcelableSize":I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 75
    .local v2, "startPosition":I
    const/4 v7, 0x0

    .line 76
    .local v7, "tmpPkg":Ljava/lang/String;
    const/4 v5, 0x0

    .line 77
    .local v5, "tmpOpPkg":Ljava/lang/String;
    const/4 v4, -0x1

    .line 78
    .local v4, "tmpId":I
    const/4 v10, 0x0

    .line 79
    .local v10, "tmpTag":Ljava/lang/String;
    const/4 v11, -0x1

    .line 80
    .local v11, "tmpUid":I
    const/4 v6, -0x1

    .line 81
    .local v6, "tmpPid":I
    const/4 v3, 0x0

    .line 82
    .local v3, "tmpCustomTile":Lcyanogenmod/app/CustomTile;
    const/4 v12, 0x0

    .line 83
    .local v12, "tmpUser":Landroid/os/UserHandle;
    const-wide/16 v8, -0x1

    .line 88
    .local v8, "tmpPostTime":J
    const/4 v13, 0x1

    if-lt v1, v13, :cond_47

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v5

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v4

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v13

    if-eqz v13, :cond_65

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v10

    .line 98
    :goto_32
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v11

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 100
    new-instance v3, Lcyanogenmod/app/CustomTile;

    .end local v3    # "tmpCustomTile":Lcyanogenmod/app/CustomTile;
    invoke-direct {v3, p1}, Lcyanogenmod/app/CustomTile;-><init>(Landroid/os/Parcel;)V

    .line 101
    .restart local v3    # "tmpCustomTile":Lcyanogenmod/app/CustomTile;
    invoke-static {p1}, Landroid/os/UserHandle;->readFromParcel(Landroid/os/Parcel;)Landroid/os/UserHandle;

    move-result-object v12

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v8

    .line 106
    :cond_47
    iput-object v7, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->pkg:Ljava/lang/String;

    .line 107
    iput-object v5, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->opPkg:Ljava/lang/String;

    .line 108
    iput v4, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->id:I

    .line 109
    iput-object v10, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    .line 110
    iput v11, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->uid:I

    .line 111
    iput v6, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->initialPid:I

    .line 112
    iput-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->customTile:Lcyanogenmod/app/CustomTile;

    .line 113
    iput-object v12, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    .line 114
    iput-wide v8, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->postTime:J

    .line 115
    invoke-direct {p0}, Lcyanogenmod/app/StatusBarPanelCustomTile;->key()Ljava/lang/String;

    move-result-object v13

    iput-object v13, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->key:Ljava/lang/String;

    .line 117
    add-int v13, v2, v0

    invoke-virtual {p1, v13}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 118
    return-void

    .line 96
    :cond_65
    const/4 v10, 0x0

    goto :goto_32
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILcyanogenmod/app/CustomTile;Landroid/os/UserHandle;)V
    .registers 20
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "opPkg"    # Ljava/lang/String;
    .param p3, "id"    # I
    .param p4, "tag"    # Ljava/lang/String;
    .param p5, "uid"    # I
    .param p6, "initialPid"    # I
    .param p7, "customTile"    # Lcyanogenmod/app/CustomTile;
    .param p8, "user"    # Landroid/os/UserHandle;

    .prologue
    .line 44
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    invoke-direct/range {v0 .. v10}, Lcyanogenmod/app/StatusBarPanelCustomTile;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILcyanogenmod/app/CustomTile;Landroid/os/UserHandle;J)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILcyanogenmod/app/CustomTile;Landroid/os/UserHandle;J)V
    .registers 12
    .param p1, "pkg"    # Ljava/lang/String;
    .param p2, "opPkg"    # Ljava/lang/String;
    .param p3, "id"    # I
    .param p4, "tag"    # Ljava/lang/String;
    .param p5, "uid"    # I
    .param p6, "initialPid"    # I
    .param p7, "customTile"    # Lcyanogenmod/app/CustomTile;
    .param p8, "user"    # Landroid/os/UserHandle;
    .param p9, "postTime"    # J

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    if-nez p1, :cond_b

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 52
    :cond_b
    if-nez p7, :cond_13

    new-instance v0, Ljava/lang/NullPointerException;

    invoke-direct {v0}, Ljava/lang/NullPointerException;-><init>()V

    throw v0

    .line 54
    :cond_13
    iput-object p1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->pkg:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->opPkg:Ljava/lang/String;

    .line 56
    iput p3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->id:I

    .line 57
    iput-object p4, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    .line 58
    iput p5, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->uid:I

    .line 59
    iput p6, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->initialPid:I

    .line 60
    iput-object p7, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->customTile:Lcyanogenmod/app/CustomTile;

    .line 61
    iput-object p8, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    .line 62
    iput-wide p9, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->postTime:J

    .line 63
    invoke-direct {p0}, Lcyanogenmod/app/StatusBarPanelCustomTile;->key()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->key:Ljava/lang/String;

    .line 64
    return-void
.end method

.method private key()Ljava/lang/String;
    .registers 3

    .prologue
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    invoke-virtual {v1}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->pkg:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->uid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clone()Lcyanogenmod/app/StatusBarPanelCustomTile;
    .registers 12

    .prologue
    .line 187
    new-instance v0, Lcyanogenmod/app/StatusBarPanelCustomTile;

    iget-object v1, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->pkg:Ljava/lang/String;

    iget-object v2, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->opPkg:Ljava/lang/String;

    iget v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->id:I

    iget-object v4, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    iget v5, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->uid:I

    iget v6, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->initialPid:I

    iget-object v7, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->customTile:Lcyanogenmod/app/CustomTile;

    invoke-virtual {v7}, Lcyanogenmod/app/CustomTile;->clone()Lcyanogenmod/app/CustomTile;

    move-result-object v7

    iget-object v8, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    iget-wide v9, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->postTime:J

    invoke-direct/range {v0 .. v10}, Lcyanogenmod/app/StatusBarPanelCustomTile;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILcyanogenmod/app/CustomTile;Landroid/os/UserHandle;J)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 28
    invoke-virtual {p0}, Lcyanogenmod/app/StatusBarPanelCustomTile;->clone()Lcyanogenmod/app/StatusBarPanelCustomTile;

    move-result-object v0

    return-object v0
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 147
    const/4 v0, 0x0

    return v0
.end method

.method public getCustomTile()Lcyanogenmod/app/CustomTile;
    .registers 2

    .prologue
    .line 142
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->customTile:Lcyanogenmod/app/CustomTile;

    return-object v0
.end method

.method public getId()I
    .registers 2

    .prologue
    .line 206
    iget v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->id:I

    return v0
.end method

.method public getInitialPid()I
    .registers 2

    .prologue
    .line 233
    iget v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->initialPid:I

    return v0
.end method

.method public getKey()Ljava/lang/String;
    .registers 2

    .prologue
    .line 218
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->key:Ljava/lang/String;

    return-object v0
.end method

.method public getOpPkg()Ljava/lang/String;
    .registers 2

    .prologue
    .line 228
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->opPkg:Ljava/lang/String;

    return-object v0
.end method

.method public getPackage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 201
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->pkg:Ljava/lang/String;

    return-object v0
.end method

.method public getPostTime()J
    .registers 3

    .prologue
    .line 245
    iget-wide v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->postTime:J

    return-wide v0
.end method

.method public getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 211
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    return-object v0
.end method

.method public getUid()I
    .registers 2

    .prologue
    .line 223
    iget v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->uid:I

    return v0
.end method

.method public getUser()Landroid/os/UserHandle;
    .registers 2

    .prologue
    .line 240
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    return-object v0
.end method

.method public getUserId()I
    .registers 2

    .prologue
    .line 196
    iget-object v0, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    invoke-virtual {v0}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 9
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 154
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 158
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 159
    .local v1, "sizePosition":I
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 160
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 163
    .local v2, "startPosition":I
    iget-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->pkg:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 164
    iget-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->opPkg:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 165
    iget v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->id:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 166
    iget-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    if-eqz v3, :cond_56

    .line 167
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 168
    iget-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->tag:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 172
    :goto_2b
    iget v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->uid:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 173
    iget v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->initialPid:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 174
    iget-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->customTile:Lcyanogenmod/app/CustomTile;

    invoke-virtual {v3, p1, p2}, Lcyanogenmod/app/CustomTile;->writeToParcel(Landroid/os/Parcel;I)V

    .line 175
    iget-object v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->user:Landroid/os/UserHandle;

    invoke-virtual {v3, p1, p2}, Landroid/os/UserHandle;->writeToParcel(Landroid/os/Parcel;I)V

    .line 176
    iget-wide v3, p0, Lcyanogenmod/app/StatusBarPanelCustomTile;->postTime:J

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->writeLong(J)V

    .line 179
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 180
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 181
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 182
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 183
    return-void

    .line 170
    .end local v0    # "parcelableSize":I
    :cond_56
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_2b
.end method
