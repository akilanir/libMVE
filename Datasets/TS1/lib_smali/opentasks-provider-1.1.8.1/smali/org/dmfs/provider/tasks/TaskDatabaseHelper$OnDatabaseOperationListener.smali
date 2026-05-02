.class public interface abstract Lorg/dmfs/provider/tasks/TaskDatabaseHelper$OnDatabaseOperationListener;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/dmfs/provider/tasks/TaskDatabaseHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnDatabaseOperationListener"
.end annotation


# virtual methods
.method public abstract onDatabaseCreated(Landroid/database/sqlite/SQLiteDatabase;)V
.end method

.method public abstract onDatabaseUpdate(Landroid/database/sqlite/SQLiteDatabase;II)V
.end method
