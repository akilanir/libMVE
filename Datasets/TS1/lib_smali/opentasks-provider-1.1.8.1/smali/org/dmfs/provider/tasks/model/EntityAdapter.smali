.class public interface abstract Lorg/dmfs/provider/tasks/model/EntityAdapter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<EntityType:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract commit(Landroid/database/sqlite/SQLiteDatabase;)I
.end method

.method public abstract duplicate()Lorg/dmfs/provider/tasks/model/EntityAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lorg/dmfs/provider/tasks/model/EntityAdapter",
            "<TEntityType;>;"
        }
    .end annotation
.end method

.method public abstract getState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;)TT;"
        }
    .end annotation
.end method

.method public abstract hasUpdates()Z
.end method

.method public abstract id()J
.end method

.method public abstract isUpdated(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;)Z"
        }
    .end annotation
.end method

.method public abstract isWriteable()Z
.end method

.method public abstract oldValueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;)TT;"
        }
    .end annotation
.end method

.method public abstract set(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;TT;)V"
        }
    .end annotation
.end method

.method public abstract setState(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;TT;)V"
        }
    .end annotation
.end method

.method public abstract unset(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;)V"
        }
    .end annotation
.end method

.method public abstract uri(Ljava/lang/String;)Landroid/net/Uri;
.end method

.method public abstract valueOf(Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/dmfs/provider/tasks/model/adapters/FieldAdapter",
            "<TT;TEntityType;>;)TT;"
        }
    .end annotation
.end method
