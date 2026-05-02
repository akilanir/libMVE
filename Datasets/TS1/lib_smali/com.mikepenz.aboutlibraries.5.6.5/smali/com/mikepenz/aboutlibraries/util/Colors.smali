.class public Lcom/mikepenz/aboutlibraries/util/Colors;
.super Ljava/lang/Object;
.source "Colors.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public appBarColor:I

.field public statusBarColor:I


# direct methods
.method public constructor <init>(II)V
    .registers 3
    .param p1, "toolbarColor"    # I
    .param p2, "statusBarColor"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Lcom/mikepenz/aboutlibraries/util/Colors;->appBarColor:I

    .line 16
    iput p2, p0, Lcom/mikepenz/aboutlibraries/util/Colors;->statusBarColor:I

    .line 17
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .registers 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/mikepenz/aboutlibraries/util/Colors;->appBarColor:I

    .line 21
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/mikepenz/aboutlibraries/util/Colors;->statusBarColor:I

    .line 22
    return-void
.end method
