.class Lde/robv/android/xposed/XSharedPreferences$1;
.super Ljava/lang/Thread;
.source "XSharedPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lde/robv/android/xposed/XSharedPreferences;->startLoadFromDisk()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lde/robv/android/xposed/XSharedPreferences;


# direct methods
.method constructor <init>(Lde/robv/android/xposed/XSharedPreferences;Ljava/lang/String;)V
    .registers 3
    .param p2, "$anonymous0"    # Ljava/lang/String;

    .prologue
    .line 1
    iput-object p1, p0, Lde/robv/android/xposed/XSharedPreferences$1;->this$0:Lde/robv/android/xposed/XSharedPreferences;

    .line 64
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .prologue
    .line 67
    iget-object v1, p0, Lde/robv/android/xposed/XSharedPreferences$1;->this$0:Lde/robv/android/xposed/XSharedPreferences;

    monitor-enter v1

    .line 68
    :try_start_3
    iget-object v0, p0, Lde/robv/android/xposed/XSharedPreferences$1;->this$0:Lde/robv/android/xposed/XSharedPreferences;

    # invokes: Lde/robv/android/xposed/XSharedPreferences;->loadFromDiskLocked()V
    invoke-static {v0}, Lde/robv/android/xposed/XSharedPreferences;->access$0(Lde/robv/android/xposed/XSharedPreferences;)V

    .line 67
    monitor-exit v1

    .line 70
    return-void

    .line 67
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method
