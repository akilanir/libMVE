.class public Lcyanogenmod/app/CustomTile;
.super Ljava/lang/Object;
.source "CustomTile.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcyanogenmod/app/CustomTile$Builder;,
        Lcyanogenmod/app/CustomTile$ExpandedListItem;,
        Lcyanogenmod/app/CustomTile$ExpandedGridItem;,
        Lcyanogenmod/app/CustomTile$ExpandedItem;,
        Lcyanogenmod/app/CustomTile$ListExpandedStyle;,
        Lcyanogenmod/app/CustomTile$GridExpandedStyle;,
        Lcyanogenmod/app/CustomTile$ExpandedStyle;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcyanogenmod/app/CustomTile;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public contentDescription:Ljava/lang/String;

.field public expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

.field public icon:I

.field public label:Ljava/lang/String;

.field public onClick:Landroid/app/PendingIntent;

.field public onClickUri:Landroid/net/Uri;

.field public onSettingsClick:Landroid/content/Intent;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 678
    new-instance v0, Lcyanogenmod/app/CustomTile$1;

    invoke-direct {v0}, Lcyanogenmod/app/CustomTile$1;-><init>()V

    sput-object v0, Lcyanogenmod/app/CustomTile;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 6
    .param p1, "parcel"    # Landroid/os/Parcel;

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 90
    .local v1, "parcelableVersion":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 91
    .local v0, "parcelableSize":I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 96
    .local v2, "startPosition":I
    const/4 v3, 0x1

    if-lt v1, v3, :cond_70

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_22

    .line 98
    sget-object v3, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/PendingIntent;

    iput-object v3, p0, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    .line 100
    :cond_22
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_32

    .line 101
    sget-object v3, Landroid/content/Intent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Intent;

    iput-object v3, p0, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    .line 103
    :cond_32
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_42

    .line 104
    sget-object v3, Landroid/net/Uri;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    iput-object v3, p0, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    .line 106
    :cond_42
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_4e

    .line 107
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    .line 109
    :cond_4e
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_5a

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    .line 112
    :cond_5a
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    if-eqz v3, :cond_6a

    .line 113
    sget-object v3, Lcyanogenmod/app/CustomTile$ExpandedStyle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-interface {v3, p1}, Landroid/os/Parcelable$Creator;->createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcyanogenmod/app/CustomTile$ExpandedStyle;

    iput-object v3, p0, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    .line 115
    :cond_6a
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    iput v3, p0, Lcyanogenmod/app/CustomTile;->icon:I

    .line 118
    :cond_70
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 119
    return-void
.end method


# virtual methods
.method public clone()Lcyanogenmod/app/CustomTile;
    .registers 2

    .prologue
    .line 132
    new-instance v0, Lcyanogenmod/app/CustomTile;

    invoke-direct {v0}, Lcyanogenmod/app/CustomTile;-><init>()V

    .line 133
    .local v0, "that":Lcyanogenmod/app/CustomTile;
    invoke-virtual {p0, v0}, Lcyanogenmod/app/CustomTile;->cloneInto(Lcyanogenmod/app/CustomTile;)V

    .line 134
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
    .line 36
    invoke-virtual {p0}, Lcyanogenmod/app/CustomTile;->clone()Lcyanogenmod/app/CustomTile;

    move-result-object v0

    return-object v0
.end method

.method public cloneInto(Lcyanogenmod/app/CustomTile;)V
    .registers 3
    .param p1, "that"    # Lcyanogenmod/app/CustomTile;

    .prologue
    .line 168
    iget-object v0, p0, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    iput-object v0, p1, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    .line 169
    iget-object v0, p0, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    iput-object v0, p1, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    .line 170
    iget-object v0, p0, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    iput-object v0, p1, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    .line 171
    iget-object v0, p0, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    iput-object v0, p1, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    .line 172
    iget-object v0, p0, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    iput-object v0, p1, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    .line 173
    iget-object v0, p0, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    iput-object v0, p1, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    .line 174
    iget v0, p0, Lcyanogenmod/app/CustomTile;->icon:I

    iput v0, p1, Lcyanogenmod/app/CustomTile;->icon:I

    .line 175
    return-void
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 179
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 139
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 140
    .local v1, "b":Ljava/lang/StringBuilder;
    const-string v2, "line.separator"

    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 141
    .local v0, "NEW_LINE":Ljava/lang/String;
    iget-object v2, p0, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    if-eqz v2, :cond_2f

    .line 142
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClickUri="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    :cond_2f
    iget-object v2, p0, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    if-eqz v2, :cond_53

    .line 145
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onClick="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    invoke-virtual {v3}, Landroid/app/PendingIntent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    :cond_53
    iget-object v2, p0, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    if-eqz v2, :cond_77

    .line 148
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onSettingsClick="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    :cond_77
    iget-object v2, p0, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_9b

    .line 151
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "label="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    :cond_9b
    iget-object v2, p0, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_bf

    .line 154
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "contentDescription="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    :cond_bf
    iget-object v2, p0, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    if-eqz v2, :cond_df

    .line 157
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "expandedStyle="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    :cond_df
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "icon="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcyanogenmod/app/CustomTile;->icon:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 9
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 186
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v1

    .line 191
    .local v1, "sizePosition":I
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v2

    .line 195
    .local v2, "startPosition":I
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    if-eqz v3, :cond_6f

    .line 196
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 197
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onClick:Landroid/app/PendingIntent;

    invoke-virtual {v3, p1, v4}, Landroid/app/PendingIntent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 201
    :goto_1c
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    if-eqz v3, :cond_73

    .line 202
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 203
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onSettingsClick:Landroid/content/Intent;

    invoke-virtual {v3, p1, v4}, Landroid/content/Intent;->writeToParcel(Landroid/os/Parcel;I)V

    .line 207
    :goto_28
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    if-eqz v3, :cond_77

    .line 208
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 209
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->onClickUri:Landroid/net/Uri;

    invoke-virtual {v3, p1, v4}, Landroid/net/Uri;->writeToParcel(Landroid/os/Parcel;I)V

    .line 213
    :goto_34
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    if-eqz v3, :cond_7b

    .line 214
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 215
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->label:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 219
    :goto_40
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    if-eqz v3, :cond_7f

    .line 220
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 221
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->contentDescription:Ljava/lang/String;

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 225
    :goto_4c
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    if-eqz v3, :cond_83

    .line 226
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeInt(I)V

    .line 227
    iget-object v3, p0, Lcyanogenmod/app/CustomTile;->expandedStyle:Lcyanogenmod/app/CustomTile$ExpandedStyle;

    invoke-virtual {v3, p1, v4}, Lcyanogenmod/app/CustomTile$ExpandedStyle;->writeToParcel(Landroid/os/Parcel;I)V

    .line 231
    :goto_58
    iget v3, p0, Lcyanogenmod/app/CustomTile;->icon:I

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 234
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v3

    sub-int v0, v3, v2

    .line 235
    .local v0, "parcelableSize":I
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 236
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 237
    add-int v3, v2, v0

    invoke-virtual {p1, v3}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 238
    return-void

    .line 199
    .end local v0    # "parcelableSize":I
    :cond_6f
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1c

    .line 205
    :cond_73
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_28

    .line 211
    :cond_77
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_34

    .line 217
    :cond_7b
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_40

    .line 223
    :cond_7f
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_4c

    .line 229
    :cond_83
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_58
.end method
