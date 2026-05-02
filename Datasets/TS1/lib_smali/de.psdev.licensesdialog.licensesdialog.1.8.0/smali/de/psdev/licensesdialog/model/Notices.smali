.class public Lde/psdev/licensesdialog/model/Notices;
.super Ljava/lang/Object;
.source "Notices.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lde/psdev/licensesdialog/model/Notices;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mNotices:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lde/psdev/licensesdialog/model/Notice;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 60
    new-instance v0, Lde/psdev/licensesdialog/model/Notices$1;

    invoke-direct {v0}, Lde/psdev/licensesdialog/model/Notices$1;-><init>()V

    sput-object v0, Lde/psdev/licensesdialog/model/Notices;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/psdev/licensesdialog/model/Notices;->mNotices:Ljava/util/List;

    .line 31
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .registers 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lde/psdev/licensesdialog/model/Notices;->mNotices:Ljava/util/List;

    .line 57
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notices;->mNotices:Ljava/util/List;

    const-class v1, Lde/psdev/licensesdialog/model/Notice;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 58
    return-void
.end method


# virtual methods
.method public addNotice(Lde/psdev/licensesdialog/model/Notice;)V
    .registers 3
    .param p1, "notice"    # Lde/psdev/licensesdialog/model/Notice;

    .prologue
    .line 36
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notices;->mNotices:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    return-void
.end method

.method public describeContents()I
    .registers 2

    .prologue
    .line 47
    const/4 v0, 0x0

    return v0
.end method

.method public getNotices()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lde/psdev/licensesdialog/model/Notice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notices;->mNotices:Ljava/util/List;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 52
    iget-object v0, p0, Lde/psdev/licensesdialog/model/Notices;->mNotices:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 53
    return-void
.end method
