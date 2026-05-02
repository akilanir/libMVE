.class public Lcom/github/mikephil/charting/data/Entry;
.super Ljava/lang/Object;
.source "Entry.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/github/mikephil/charting/data/Entry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mData:Ljava/lang/Object;

.field private mVal:F

.field private mXIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 179
    new-instance v0, Lcom/github/mikephil/charting/data/Entry$1;

    invoke-direct {v0}, Lcom/github/mikephil/charting/data/Entry$1;-><init>()V

    sput-object v0, Lcom/github/mikephil/charting/data/Entry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(FI)V
    .registers 4
    .param p1, "val"    # F
    .param p2, "xIndex"    # I

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    .line 34
    iput p1, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    .line 35
    iput p2, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    .line 36
    return-void
.end method

.method public constructor <init>(FILjava/lang/Object;)V
    .registers 4
    .param p1, "val"    # F
    .param p2, "xIndex"    # I
    .param p3, "data"    # Ljava/lang/Object;

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Lcom/github/mikephil/charting/data/Entry;-><init>(FI)V

    .line 50
    iput-object p3, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    .line 51
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    .line 23
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    .line 172
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    .line 173
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    .line 174
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2b

    .line 175
    const-class v0, Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    .line 177
    :cond_2b
    return-void
.end method


# virtual methods
.method public copy()Lcom/github/mikephil/charting/data/Entry;
    .registers 5

    .prologue
    .line 114
    new-instance v0, Lcom/github/mikephil/charting/data/Entry;

    iget v1, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    iget v2, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    iget-object v3, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    invoke-direct {v0, v1, v2, v3}, Lcom/github/mikephil/charting/data/Entry;-><init>(FILjava/lang/Object;)V

    .line 115
    .local v0, "e":Lcom/github/mikephil/charting/data/Entry;
    return-object v0
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 152
    const/4 v0, 0x0

    return v0
.end method

.method public equalTo(Lcom/github/mikephil/charting/data/Entry;)Z
    .registers 5
    .param p1, "e"    # Lcom/github/mikephil/charting/data/Entry;

    .prologue
    const/4 v0, 0x0

    .line 128
    if-nez p1, :cond_4

    .line 139
    :cond_3
    :goto_3
    return v0

    .line 131
    :cond_4
    iget-object v1, p1, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    iget-object v2, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    if-ne v1, v2, :cond_3

    .line 133
    iget v1, p1, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    iget v2, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    if-ne v1, v2, :cond_3

    .line 136
    iget v1, p1, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    iget v2, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const v2, 0x3727c5ac    # 1.0E-5f

    cmpl-float v1, v1, v2

    if-gtz v1, :cond_3

    .line 139
    const/4 v0, 0x1

    goto :goto_3
.end method

.method public getData()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    return-object v0
.end method

.method public getVal()F
    .registers 2

    .prologue
    .line 77
    iget v0, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    return v0
.end method

.method public getXIndex()I
    .registers 2

    .prologue
    .line 59
    iget v0, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    return v0
.end method

.method public setData(Ljava/lang/Object;)V
    .registers 2
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    .line 106
    return-void
.end method

.method public setVal(F)V
    .registers 2
    .param p1, "val"    # F

    .prologue
    .line 86
    iput p1, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    .line 87
    return-void
.end method

.method public setXIndex(I)V
    .registers 2
    .param p1, "x"    # I

    .prologue
    .line 68
    iput p1, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    .line 69
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 147
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Entry, xIndex: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " val (sum): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/github/mikephil/charting/data/Entry;->getVal()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 157
    iget v0, p0, Lcom/github/mikephil/charting/data/Entry;->mVal:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    .line 158
    iget v0, p0, Lcom/github/mikephil/charting/data/Entry;->mXIndex:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 159
    iget-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    if-eqz v0, :cond_28

    .line 160
    iget-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    instance-of v0, v0, Landroid/os/Parcelable;

    if-eqz v0, :cond_20

    .line 161
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 162
    iget-object v0, p0, Lcom/github/mikephil/charting/data/Entry;->mData:Ljava/lang/Object;

    check-cast v0, Landroid/os/Parcelable;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 169
    :goto_1f
    return-void

    .line 164
    :cond_20
    new-instance v0, Landroid/os/ParcelFormatException;

    const-string v1, "Cannot parcel an Entry with non-parcelable data"

    invoke-direct {v0, v1}, Landroid/os/ParcelFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 167
    :cond_28
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1f
.end method
