.class public abstract Lorg/dmfs/provider/tasks/model/AbstractListAdapter;
.super Ljava/lang/Object;

# interfaces
.implements Lorg/dmfs/provider/tasks/model/ListAdapter;


# instance fields
.field private final mState:Landroid/content/ContentValues;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/content/ContentValues;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    iput-object v0, p0, Lorg/dmfs/provider/tasks/model/AbstractListAdapter;->mState:Landroid/content/ContentValues;

    return-void
.end method


# virtual methods
.method public getState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;)TT;"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/AbstractListAdapter;->mState:Landroid/content/ContentValues;

    invoke-interface {p1, v0}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->getFrom(Landroid/content/ContentValues;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public setState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;",
            "Lorg/dmfs/provider/tasks/model/ListAdapter;",
            ">;TT;)V"
        }
    .end annotation

    iget-object v0, p0, Lorg/dmfs/provider/tasks/model/AbstractListAdapter;->mState:Landroid/content/ContentValues;

    invoke-interface {p1, v0, p2}, Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;->setIn(Landroid/content/ContentValues;Ljava/lang/Object;)V

    return-void
.end method

.method public uri(Ljava/lang/String;)Landroid/net/Uri;
    .registers 5

    invoke-static {p1}, Lorg/dmfs/provider/tasks/TaskContract$TaskLists;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lorg/dmfs/provider/tasks/model/AbstractListAdapter;->id()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method
