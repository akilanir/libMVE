.class Lcom/github/mrengineer13/snackbar/Snack;
.super Ljava/lang/Object;
.source "Snack.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/github/mrengineer13/snackbar/Snack;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mActionIcon:I

.field final mActionMessage:Ljava/lang/String;

.field final mBackgroundColor:Landroid/content/res/ColorStateList;

.field final mBtnTextColor:Landroid/content/res/ColorStateList;

.field final mDuration:S

.field final mHeight:I

.field final mMessage:Ljava/lang/String;

.field final mToken:Landroid/os/Parcelable;

.field mTypeface:Landroid/graphics/Typeface;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 72
    new-instance v0, Lcom/github/mrengineer13/snackbar/Snack$1;

    invoke-direct {v0}, Lcom/github/mrengineer13/snackbar/Snack$1;-><init>()V

    sput-object v0, Lcom/github/mrengineer13/snackbar/Snack;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mMessage:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mActionMessage:Ljava/lang/String;

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mActionIcon:I

    .line 46
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mToken:Landroid/os/Parcelable;

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    int-to-short v0, v0

    iput-short v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mDuration:S

    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mBtnTextColor:Landroid/content/res/ColorStateList;

    .line 49
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/res/ColorStateList;

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mBackgroundColor:Landroid/content/res/ColorStateList;

    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mHeight:I

    .line 51
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Typeface;

    iput-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mTypeface:Landroid/graphics/Typeface;

    .line 52
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ILandroid/os/Parcelable;SLandroid/content/res/ColorStateList;Landroid/content/res/ColorStateList;ILandroid/graphics/Typeface;)V
    .registers 10
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "actionMessage"    # Ljava/lang/String;
    .param p3, "actionIcon"    # I
    .param p4, "token"    # Landroid/os/Parcelable;
    .param p5, "duration"    # S
    .param p6, "textColor"    # Landroid/content/res/ColorStateList;
    .param p7, "backgroundColor"    # Landroid/content/res/ColorStateList;
    .param p8, "height"    # I
    .param p9, "typeFace"    # Landroid/graphics/Typeface;

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lcom/github/mrengineer13/snackbar/Snack;->mMessage:Ljava/lang/String;

    .line 32
    iput-object p2, p0, Lcom/github/mrengineer13/snackbar/Snack;->mActionMessage:Ljava/lang/String;

    .line 33
    iput p3, p0, Lcom/github/mrengineer13/snackbar/Snack;->mActionIcon:I

    .line 34
    iput-object p4, p0, Lcom/github/mrengineer13/snackbar/Snack;->mToken:Landroid/os/Parcelable;

    .line 35
    iput-short p5, p0, Lcom/github/mrengineer13/snackbar/Snack;->mDuration:S

    .line 36
    iput-object p6, p0, Lcom/github/mrengineer13/snackbar/Snack;->mBtnTextColor:Landroid/content/res/ColorStateList;

    .line 37
    iput-object p7, p0, Lcom/github/mrengineer13/snackbar/Snack;->mBackgroundColor:Landroid/content/res/ColorStateList;

    .line 38
    iput p8, p0, Lcom/github/mrengineer13/snackbar/Snack;->mHeight:I

    .line 39
    iput-object p9, p0, Lcom/github/mrengineer13/snackbar/Snack;->mTypeface:Landroid/graphics/Typeface;

    .line 40
    return-void
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 68
    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 5
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x0

    .line 56
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 57
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mActionMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 58
    iget v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mActionIcon:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 59
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mToken:Landroid/os/Parcelable;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 60
    iget-short v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mDuration:S

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 61
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mBtnTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 62
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mBackgroundColor:Landroid/content/res/ColorStateList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 63
    iget v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mHeight:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 64
    iget-object v0, p0, Lcom/github/mrengineer13/snackbar/Snack;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    .line 65
    return-void
.end method
