.class Lorg/androidannotations/api/ViewServer$ViewServerWorker;
.super Ljava/lang/Object;
.source "ViewServer.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lorg/androidannotations/api/ViewServer$WindowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/androidannotations/api/ViewServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewServerWorker"
.end annotation


# instance fields
.field private mClient:Ljava/net/Socket;

.field private final mLock:[Ljava/lang/Object;

.field private mNeedFocusedWindowUpdate:Z

.field private mNeedWindowListUpdate:Z

.field final synthetic this$0:Lorg/androidannotations/api/ViewServer;


# direct methods
.method public constructor <init>(Lorg/androidannotations/api/ViewServer;Ljava/net/Socket;)V
    .registers 5
    .param p2, "client"    # Ljava/net/Socket;

    .prologue
    const/4 v1, 0x0

    .line 571
    iput-object p1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 569
    new-array v0, v1, [Ljava/lang/Object;

    iput-object v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    .line 572
    iput-object p2, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    .line 573
    iput-boolean v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    .line 574
    iput-boolean v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    .line 575
    return-void
.end method

.method private findWindow(I)Landroid/view/View;
    .registers 7
    .param p1, "hashCode"    # I

    .prologue
    .line 689
    const/4 v3, -0x1

    if-ne p1, v3, :cond_34

    .line 690
    const/4 v2, 0x0

    .line 691
    .local v2, "window":Landroid/view/View;
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 693
    :try_start_11
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;
    :try_end_16
    .catchall {:try_start_11 .. :try_end_16} :catchall_25

    move-result-object v2

    .line 695
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 711
    .end local v2    # "window":Landroid/view/View;
    :goto_24
    return-object v2

    .line 695
    .restart local v2    # "window":Landroid/view/View;
    :catchall_25
    move-exception v3

    iget-object v4, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v4}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v3

    .line 700
    .end local v2    # "window":Landroid/view/View;
    :cond_34
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 702
    :try_start_41
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_4f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 703
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    if-ne v3, p1, :cond_4f

    .line 704
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;
    :try_end_6b
    .catchall {:try_start_41 .. :try_end_6b} :catchall_89

    .line 708
    iget-object v4, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v4}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    move-object v2, v3

    goto :goto_24

    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    :cond_7a
    iget-object v3, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v3}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 711
    const/4 v2, 0x0

    goto :goto_24

    .line 708
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_89
    move-exception v3

    iget-object v4, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v4}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v3
.end method

.method private getFocusedWindow(Ljava/net/Socket;)Z
    .registers 12
    .param p1, "client"    # Ljava/net/Socket;

    .prologue
    .line 751
    const/4 v7, 0x1

    .line 752
    .local v7, "result":Z
    const/4 v3, 0x0

    .line 754
    .local v3, "focusName":Ljava/lang/String;
    const/4 v5, 0x0

    .line 756
    .local v5, "out":Ljava/io/BufferedWriter;
    :try_start_3
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .line 757
    .local v1, "clientStream":Ljava/io/OutputStream;
    new-instance v6, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/OutputStreamWriter;

    invoke-direct {v8, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    const/16 v9, 0x2000

    invoke-direct {v6, v8, v9}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_13} :catch_c1
    .catchall {:try_start_3 .. :try_end_13} :catchall_bf

    .line 759
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .local v6, "out":Ljava/io/BufferedWriter;
    const/4 v4, 0x0

    .line 761
    .local v4, "focusedWindow":Landroid/view/View;
    :try_start_14
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_21} :catch_95
    .catchall {:try_start_14 .. :try_end_21} :catchall_b0

    .line 763
    :try_start_21
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;
    :try_end_26
    .catchall {:try_start_21 .. :try_end_26} :catchall_86

    move-result-object v4

    .line 765
    :try_start_27
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 768
    if-eqz v4, :cond_77

    .line 769
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V
    :try_end_43
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_43} :catch_95
    .catchall {:try_start_27 .. :try_end_43} :catchall_b0

    .line 771
    :try_start_43
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/HashMap;

    move-result-object v8

    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusedWindow:Landroid/view/View;
    invoke-static {v9}, Lorg/androidannotations/api/ViewServer;->access$400(Lorg/androidannotations/api/ViewServer;)Landroid/view/View;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v0, v8

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_57
    .catchall {:try_start_43 .. :try_end_57} :catchall_a1

    .line 773
    :try_start_57
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 776
    invoke-static {v4}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 777
    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ljava/io/BufferedWriter;->write(I)V

    .line 778
    invoke-virtual {v6, v3}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 780
    :cond_77
    const/16 v8, 0xa

    invoke-virtual {v6, v8}, Ljava/io/BufferedWriter;->write(I)V

    .line 781
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->flush()V
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_7f} :catch_95
    .catchall {:try_start_57 .. :try_end_7f} :catchall_b0

    .line 785
    if-eqz v6, :cond_c3

    .line 787
    :try_start_81
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_84} :catch_b8

    move-object v5, v6

    .line 794
    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "focusedWindow":Landroid/view/View;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :cond_85
    :goto_85
    return v7

    .line 765
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :catchall_86
    move-exception v8

    :try_start_87
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mFocusLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v9}, Lorg/androidannotations/api/ViewServer;->access$600(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v8
    :try_end_95
    .catch Ljava/lang/Exception; {:try_start_87 .. :try_end_95} :catch_95
    .catchall {:try_start_87 .. :try_end_95} :catchall_b0

    .line 782
    :catch_95
    move-exception v2

    move-object v5, v6

    .line 783
    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "focusedWindow":Landroid/view/View;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .local v2, "e":Ljava/lang/Exception;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :goto_97
    const/4 v7, 0x0

    .line 785
    if-eqz v5, :cond_85

    .line 787
    :try_start_9a
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_9a .. :try_end_9d} :catch_9e

    goto :goto_85

    .line 788
    :catch_9e
    move-exception v2

    .line 789
    .local v2, "e":Ljava/io/IOException;
    const/4 v7, 0x0

    .line 790
    goto :goto_85

    .line 773
    .end local v2    # "e":Ljava/io/IOException;
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :catchall_a1
    move-exception v8

    :try_start_a2
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v9}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v9

    invoke-virtual {v9}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    throw v8
    :try_end_b0
    .catch Ljava/lang/Exception; {:try_start_a2 .. :try_end_b0} :catch_95
    .catchall {:try_start_a2 .. :try_end_b0} :catchall_b0

    .line 785
    :catchall_b0
    move-exception v8

    move-object v5, v6

    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v4    # "focusedWindow":Landroid/view/View;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :goto_b2
    if-eqz v5, :cond_b7

    .line 787
    :try_start_b4
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_b7
    .catch Ljava/io/IOException; {:try_start_b4 .. :try_end_b7} :catch_bc

    .line 790
    :cond_b7
    :goto_b7
    throw v8

    .line 788
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :catch_b8
    move-exception v2

    .line 789
    .restart local v2    # "e":Ljava/io/IOException;
    const/4 v7, 0x0

    move-object v5, v6

    .line 790
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    goto :goto_85

    .line 788
    .end local v1    # "clientStream":Ljava/io/OutputStream;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v4    # "focusedWindow":Landroid/view/View;
    :catch_bc
    move-exception v2

    .line 789
    .restart local v2    # "e":Ljava/io/IOException;
    const/4 v7, 0x0

    goto :goto_b7

    .line 785
    .end local v2    # "e":Ljava/io/IOException;
    :catchall_bf
    move-exception v8

    goto :goto_b2

    .line 782
    :catch_c1
    move-exception v2

    goto :goto_97

    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "clientStream":Ljava/io/OutputStream;
    .restart local v4    # "focusedWindow":Landroid/view/View;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :cond_c3
    move-object v5, v6

    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    goto :goto_85
.end method

.method private listWindows(Ljava/net/Socket;)Z
    .registers 11
    .param p1, "client"    # Ljava/net/Socket;

    .prologue
    .line 715
    const/4 v6, 0x1

    .line 716
    .local v6, "result":Z
    const/4 v4, 0x0

    .line 719
    .local v4, "out":Ljava/io/BufferedWriter;
    :try_start_2
    iget-object v7, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v7}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 721
    invoke-virtual {p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    .line 722
    .local v0, "clientStream":Ljava/io/OutputStream;
    new-instance v5, Ljava/io/BufferedWriter;

    new-instance v7, Ljava/io/OutputStreamWriter;

    invoke-direct {v7, v0}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    const/16 v8, 0x2000

    invoke-direct {v5, v7, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;I)V
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_1f} :catch_af
    .catchall {:try_start_2 .. :try_end_1f} :catchall_95

    .line 724
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .local v5, "out":Ljava/io/BufferedWriter;
    :try_start_1f
    iget-object v7, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindows:Ljava/util/HashMap;
    invoke-static {v7}, Lorg/androidannotations/api/ViewServer;->access$500(Lorg/androidannotations/api/ViewServer;)Ljava/util/HashMap;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_2d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_72

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 725
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 726
    const/16 v7, 0x20

    invoke-virtual {v5, v7}, Ljava/io/BufferedWriter;->write(I)V

    .line 727
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/CharSequence;

    invoke-virtual {v5, v7}, Ljava/io/BufferedWriter;->append(Ljava/lang/CharSequence;)Ljava/io/Writer;

    .line 728
    const/16 v7, 0xa

    invoke-virtual {v5, v7}, Ljava/io/BufferedWriter;->write(I)V
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_5b} :catch_5c
    .catchall {:try_start_1f .. :try_end_5b} :catchall_ac

    goto :goto_2d

    .line 733
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Landroid/view/View;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_5c
    move-exception v1

    move-object v4, v5

    .line 734
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .local v1, "e":Ljava/lang/Exception;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :goto_5e
    const/4 v6, 0x0

    .line 736
    iget-object v7, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v7}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 738
    if-eqz v4, :cond_71

    .line 740
    :try_start_6e
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_92

    .line 747
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_71
    :goto_71
    return v6

    .line 731
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :cond_72
    :try_start_72
    const-string v7, "DONE.\n"

    invoke-virtual {v5, v7}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 732
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->flush()V
    :try_end_7a
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_7a} :catch_5c
    .catchall {:try_start_72 .. :try_end_7a} :catchall_ac

    .line 736
    iget-object v7, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v7}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 738
    if-eqz v5, :cond_b1

    .line 740
    :try_start_89
    invoke-virtual {v5}, Ljava/io/BufferedWriter;->close()V
    :try_end_8c
    .catch Ljava/io/IOException; {:try_start_89 .. :try_end_8c} :catch_8e

    move-object v4, v5

    .line 743
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    goto :goto_71

    .line 741
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :catch_8e
    move-exception v1

    .line 742
    .local v1, "e":Ljava/io/IOException;
    const/4 v6, 0x0

    move-object v4, v5

    .line 743
    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    goto :goto_71

    .line 741
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    .end local v3    # "i$":Ljava/util/Iterator;
    .local v1, "e":Ljava/lang/Exception;
    :catch_92
    move-exception v1

    .line 742
    .local v1, "e":Ljava/io/IOException;
    const/4 v6, 0x0

    .line 743
    goto :goto_71

    .line 736
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_95
    move-exception v7

    :goto_96
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # getter for: Lorg/androidannotations/api/ViewServer;->mWindowsLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;
    invoke-static {v8}, Lorg/androidannotations/api/ViewServer;->access$300(Lorg/androidannotations/api/ViewServer;)Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 738
    if-eqz v4, :cond_a8

    .line 740
    :try_start_a5
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_a8
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_a8} :catch_a9

    .line 743
    :cond_a8
    :goto_a8
    throw v7

    .line 741
    :catch_a9
    move-exception v1

    .line 742
    .restart local v1    # "e":Ljava/io/IOException;
    const/4 v6, 0x0

    goto :goto_a8

    .line 736
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :catchall_ac
    move-exception v7

    move-object v4, v5

    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    goto :goto_96

    .line 733
    .end local v0    # "clientStream":Ljava/io/OutputStream;
    :catch_af
    move-exception v1

    goto :goto_5e

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "clientStream":Ljava/io/OutputStream;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v5    # "out":Ljava/io/BufferedWriter;
    :cond_b1
    move-object v4, v5

    .end local v5    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    goto :goto_71
.end method

.method private windowCommand(Ljava/net/Socket;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 19
    .param p1, "client"    # Ljava/net/Socket;
    .param p2, "command"    # Ljava/lang/String;
    .param p3, "parameters"    # Ljava/lang/String;

    .prologue
    .line 637
    const/4 v8, 0x1

    .line 638
    .local v8, "success":Z
    const/4 v6, 0x0

    .line 642
    .local v6, "out":Ljava/io/BufferedWriter;
    const/16 v10, 0x20

    :try_start_4
    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v5

    .line 643
    .local v5, "index":I
    const/4 v10, -0x1

    if-ne v5, v10, :cond_11

    .line 644
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v5

    .line 646
    :cond_11
    const/4 v10, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 647
    .local v1, "code":Ljava/lang/String;
    const/16 v10, 0x10

    invoke-static {v1, v10}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v10

    long-to-int v4, v10

    .line 650
    .local v4, "hashCode":I
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->length()I

    move-result v10

    if-ge v5, v10, :cond_3a

    .line 651
    add-int/lit8 v10, v5, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p3

    .line 656
    :goto_2d
    invoke-direct {p0, v4}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->findWindow(I)Landroid/view/View;
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_30} :catch_a6
    .catchall {:try_start_4 .. :try_end_30} :catchall_d7

    move-result-object v9

    .line 657
    .local v9, "window":Landroid/view/View;
    if-nez v9, :cond_40

    .line 658
    const/4 v10, 0x0

    .line 676
    if-eqz v6, :cond_39

    .line 678
    :try_start_36
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_3d

    .line 685
    .end local v1    # "code":Ljava/lang/String;
    .end local v4    # "hashCode":I
    .end local v5    # "index":I
    .end local v9    # "window":Landroid/view/View;
    :cond_39
    :goto_39
    return v10

    .line 653
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v4    # "hashCode":I
    .restart local v5    # "index":I
    :cond_3a
    :try_start_3a
    const-string p3, ""

    goto :goto_2d

    .line 679
    .restart local v9    # "window":Landroid/view/View;
    :catch_3d
    move-exception v3

    .line 680
    .local v3, "e":Ljava/io/IOException;
    const/4 v8, 0x0

    goto :goto_39

    .line 662
    .end local v3    # "e":Ljava/io/IOException;
    :cond_40
    const-class v10, Landroid/view/ViewDebug;

    const-string v11, "dispatchCommand"

    const/4 v12, 0x4

    new-array v12, v12, [Ljava/lang/Class;

    const/4 v13, 0x0

    const-class v14, Landroid/view/View;

    aput-object v14, v12, v13

    const/4 v13, 0x1

    const-class v14, Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x2

    const-class v14, Ljava/lang/String;

    aput-object v14, v12, v13

    const/4 v13, 0x3

    const-class v14, Ljava/io/OutputStream;

    aput-object v14, v12, v13

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 663
    .local v2, "dispatch":Ljava/lang/reflect/Method;
    const/4 v10, 0x1

    invoke-virtual {v2, v10}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 664
    const/4 v10, 0x0

    const/4 v11, 0x4

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v9, v11, v12

    const/4 v12, 0x1

    aput-object p2, v11, v12

    const/4 v12, 0x2

    aput-object p3, v11, v12

    const/4 v12, 0x3

    new-instance v13, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v14

    invoke-direct {v13, v14}, Lorg/androidannotations/api/ViewServer$UncloseableOuputStream;-><init>(Ljava/io/OutputStream;)V

    aput-object v13, v11, v12

    invoke-virtual {v2, v10, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 666
    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->isOutputShutdown()Z

    move-result v10

    if-nez v10, :cond_9c

    .line 667
    new-instance v7, Ljava/io/BufferedWriter;

    new-instance v10, Ljava/io/OutputStreamWriter;

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v11

    invoke-direct {v10, v11}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v7, v10}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_93
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_93} :catch_a6
    .catchall {:try_start_3a .. :try_end_93} :catchall_d7

    .line 668
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .local v7, "out":Ljava/io/BufferedWriter;
    :try_start_93
    const-string v10, "DONE\n"

    invoke-virtual {v7, v10}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 669
    invoke-virtual {v7}, Ljava/io/BufferedWriter;->flush()V
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_93 .. :try_end_9b} :catch_e4
    .catchall {:try_start_93 .. :try_end_9b} :catchall_e1

    move-object v6, v7

    .line 676
    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    :cond_9c
    if-eqz v6, :cond_a1

    .line 678
    :try_start_9e
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_a1
    .catch Ljava/io/IOException; {:try_start_9e .. :try_end_a1} :catch_a3

    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "dispatch":Ljava/lang/reflect/Method;
    .end local v4    # "hashCode":I
    .end local v5    # "index":I
    .end local v9    # "window":Landroid/view/View;
    :cond_a1
    :goto_a1
    move v10, v8

    .line 685
    goto :goto_39

    .line 679
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v2    # "dispatch":Ljava/lang/reflect/Method;
    .restart local v4    # "hashCode":I
    .restart local v5    # "index":I
    .restart local v9    # "window":Landroid/view/View;
    :catch_a3
    move-exception v3

    .line 680
    .restart local v3    # "e":Ljava/io/IOException;
    const/4 v8, 0x0

    .line 681
    goto :goto_a1

    .line 672
    .end local v1    # "code":Ljava/lang/String;
    .end local v2    # "dispatch":Ljava/lang/reflect/Method;
    .end local v3    # "e":Ljava/io/IOException;
    .end local v4    # "hashCode":I
    .end local v5    # "index":I
    .end local v9    # "window":Landroid/view/View;
    :catch_a6
    move-exception v3

    .line 673
    .local v3, "e":Ljava/lang/Exception;
    :goto_a7
    :try_start_a7
    const-string v10, "ViewServer"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Could not send command "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p2

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " with parameters "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move-object/from16 v0, p3

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_cd
    .catchall {:try_start_a7 .. :try_end_cd} :catchall_d7

    .line 674
    const/4 v8, 0x0

    .line 676
    if-eqz v6, :cond_a1

    .line 678
    :try_start_d0
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_d3
    .catch Ljava/io/IOException; {:try_start_d0 .. :try_end_d3} :catch_d4

    goto :goto_a1

    .line 679
    :catch_d4
    move-exception v3

    .line 680
    .local v3, "e":Ljava/io/IOException;
    const/4 v8, 0x0

    .line 681
    goto :goto_a1

    .line 676
    .end local v3    # "e":Ljava/io/IOException;
    :catchall_d7
    move-exception v10

    :goto_d8
    if-eqz v6, :cond_dd

    .line 678
    :try_start_da
    invoke-virtual {v6}, Ljava/io/BufferedWriter;->close()V
    :try_end_dd
    .catch Ljava/io/IOException; {:try_start_da .. :try_end_dd} :catch_de

    .line 681
    :cond_dd
    :goto_dd
    throw v10

    .line 679
    :catch_de
    move-exception v3

    .line 680
    .restart local v3    # "e":Ljava/io/IOException;
    const/4 v8, 0x0

    goto :goto_dd

    .line 676
    .end local v3    # "e":Ljava/io/IOException;
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "code":Ljava/lang/String;
    .restart local v2    # "dispatch":Ljava/lang/reflect/Method;
    .restart local v4    # "hashCode":I
    .restart local v5    # "index":I
    .restart local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v9    # "window":Landroid/view/View;
    :catchall_e1
    move-exception v10

    move-object v6, v7

    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    goto :goto_d8

    .line 672
    .end local v6    # "out":Ljava/io/BufferedWriter;
    .restart local v7    # "out":Ljava/io/BufferedWriter;
    :catch_e4
    move-exception v3

    move-object v6, v7

    .end local v7    # "out":Ljava/io/BufferedWriter;
    .restart local v6    # "out":Ljava/io/BufferedWriter;
    goto :goto_a7
.end method

.method private windowManagerAutolistLoop()Z
    .registers 8

    .prologue
    .line 814
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->addWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v5, p0}, Lorg/androidannotations/api/ViewServer;->access$700(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    .line 815
    const/4 v3, 0x0

    .line 817
    .local v3, "out":Ljava/io/BufferedWriter;
    :try_start_6
    new-instance v4, Ljava/io/BufferedWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v6}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v4, v5}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_16} :catch_8e
    .catchall {:try_start_6 .. :try_end_16} :catchall_8c

    .line 818
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .local v4, "out":Ljava/io/BufferedWriter;
    :cond_16
    :goto_16
    :try_start_16
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-nez v5, :cond_7a

    .line 819
    const/4 v2, 0x0

    .line 820
    .local v2, "needWindowListUpdate":Z
    const/4 v1, 0x0

    .line 821
    .local v1, "needFocusedWindowUpdate":Z
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    monitor-enter v6
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_21} :catch_32
    .catchall {:try_start_16 .. :try_end_21} :catchall_6d

    .line 822
    :goto_21
    :try_start_21
    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    if-nez v5, :cond_47

    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    if-nez v5, :cond_47

    .line 823
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->wait()V

    goto :goto_21

    .line 833
    :catchall_2f
    move-exception v5

    monitor-exit v6
    :try_end_31
    .catchall {:try_start_21 .. :try_end_31} :catchall_2f

    :try_start_31
    throw v5
    :try_end_32
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_32} :catch_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_6d

    .line 843
    .end local v1    # "needFocusedWindowUpdate":Z
    .end local v2    # "needWindowListUpdate":Z
    :catch_32
    move-exception v0

    move-object v3, v4

    .line 844
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .local v0, "e":Ljava/lang/Exception;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :goto_34
    :try_start_34
    const-string v5, "ViewServer"

    const-string v6, "Connection error: "

    invoke-static {v5, v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3b
    .catchall {:try_start_34 .. :try_end_3b} :catchall_8c

    .line 846
    if-eqz v3, :cond_40

    .line 848
    :try_start_3d
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_40
    .catch Ljava/io/IOException; {:try_start_3d .. :try_end_40} :catch_88

    .line 853
    :cond_40
    :goto_40
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v5, p0}, Lorg/androidannotations/api/ViewServer;->access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    .line 855
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_45
    const/4 v5, 0x1

    return v5

    .line 825
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v1    # "needFocusedWindowUpdate":Z
    .restart local v2    # "needWindowListUpdate":Z
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :cond_47
    :try_start_47
    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    if-eqz v5, :cond_4f

    .line 826
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    .line 827
    const/4 v2, 0x1

    .line 829
    :cond_4f
    iget-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    if-eqz v5, :cond_57

    .line 830
    const/4 v5, 0x0

    iput-boolean v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    .line 831
    const/4 v1, 0x1

    .line 833
    :cond_57
    monitor-exit v6
    :try_end_58
    .catchall {:try_start_47 .. :try_end_58} :catchall_2f

    .line 834
    if-eqz v2, :cond_62

    .line 835
    :try_start_5a
    const-string v5, "LIST UPDATE\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 836
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V

    .line 838
    :cond_62
    if-eqz v1, :cond_16

    .line 839
    const-string v5, "FOCUS UPDATE\n"

    invoke-virtual {v4, v5}, Ljava/io/BufferedWriter;->write(Ljava/lang/String;)V

    .line 840
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->flush()V
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_6c} :catch_32
    .catchall {:try_start_5a .. :try_end_6c} :catchall_6d

    goto :goto_16

    .line 846
    .end local v1    # "needFocusedWindowUpdate":Z
    .end local v2    # "needWindowListUpdate":Z
    :catchall_6d
    move-exception v5

    move-object v3, v4

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :goto_6f
    if-eqz v3, :cond_74

    .line 848
    :try_start_71
    invoke-virtual {v3}, Ljava/io/BufferedWriter;->close()V
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_74} :catch_8a

    .line 853
    :cond_74
    :goto_74
    iget-object v6, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v6, p0}, Lorg/androidannotations/api/ViewServer;->access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    throw v5

    .line 846
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :cond_7a
    if-eqz v4, :cond_7f

    .line 848
    :try_start_7c
    invoke-virtual {v4}, Ljava/io/BufferedWriter;->close()V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_7c .. :try_end_7f} :catch_86

    .line 853
    :cond_7f
    :goto_7f
    iget-object v5, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->this$0:Lorg/androidannotations/api/ViewServer;

    # invokes: Lorg/androidannotations/api/ViewServer;->removeWindowListener(Lorg/androidannotations/api/ViewServer$WindowListener;)V
    invoke-static {v5, p0}, Lorg/androidannotations/api/ViewServer;->access$800(Lorg/androidannotations/api/ViewServer;Lorg/androidannotations/api/ViewServer$WindowListener;)V

    move-object v3, v4

    .line 854
    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    goto :goto_45

    .line 849
    .end local v3    # "out":Ljava/io/BufferedWriter;
    .restart local v4    # "out":Ljava/io/BufferedWriter;
    :catch_86
    move-exception v5

    goto :goto_7f

    .end local v4    # "out":Ljava/io/BufferedWriter;
    .restart local v0    # "e":Ljava/lang/Exception;
    .restart local v3    # "out":Ljava/io/BufferedWriter;
    :catch_88
    move-exception v5

    goto :goto_40

    .end local v0    # "e":Ljava/lang/Exception;
    :catch_8a
    move-exception v6

    goto :goto_74

    .line 846
    :catchall_8c
    move-exception v5

    goto :goto_6f

    .line 843
    :catch_8e
    move-exception v0

    goto :goto_34
.end method


# virtual methods
.method public focusChanged()V
    .registers 3

    .prologue
    .line 807
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 808
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedFocusedWindowUpdate:Z

    .line 809
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 810
    monitor-exit v1

    .line 811
    return-void

    .line 810
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public run()V
    .registers 12

    .prologue
    .line 579
    const/4 v2, 0x0

    .line 581
    .local v2, "in":Ljava/io/BufferedReader;
    :try_start_1
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    const/16 v9, 0x400

    invoke-direct {v3, v8, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_13} :catch_b7
    .catchall {:try_start_1 .. :try_end_13} :catchall_d8

    .line 583
    .end local v2    # "in":Ljava/io/BufferedReader;
    .local v3, "in":Ljava/io/BufferedReader;
    :try_start_13
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .line 588
    .local v6, "request":Ljava/lang/String;
    const/16 v8, 0x20

    invoke-virtual {v6, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 589
    .local v4, "index":I
    const/4 v8, -0x1

    if-ne v4, v8, :cond_5d

    .line 590
    move-object v0, v6

    .line 591
    .local v0, "command":Ljava/lang/String;
    const-string v5, ""

    .line 598
    .local v5, "parameters":Ljava/lang/String;
    :goto_23
    const-string v8, "PROTOCOL"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_69

    .line 599
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    const-string v9, "4"

    # invokes: Lorg/androidannotations/api/ViewServer;->writeValue(Ljava/net/Socket;Ljava/lang/String;)Z
    invoke-static {v8, v9}, Lorg/androidannotations/api/ViewServer;->access$200(Ljava/net/Socket;Ljava/lang/String;)Z

    move-result v7

    .line 612
    .local v7, "result":Z
    :goto_33
    if-nez v7, :cond_4d

    .line 613
    const-string v8, "ViewServer"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "An error occurred with the command: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4d
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_4d} :catch_f5
    .catchall {:try_start_13 .. :try_end_4d} :catchall_f2

    .line 618
    :cond_4d
    if-eqz v3, :cond_52

    .line 620
    :try_start_4f
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_4f .. :try_end_52} :catch_ac

    .line 626
    :cond_52
    :goto_52
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    if-eqz v8, :cond_f8

    .line 628
    :try_start_56
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_5b
    .catch Ljava/io/IOException; {:try_start_56 .. :try_end_5b} :catch_b1

    move-object v2, v3

    .line 634
    .end local v0    # "command":Ljava/lang/String;
    .end local v3    # "in":Ljava/io/BufferedReader;
    .end local v4    # "index":I
    .end local v5    # "parameters":Ljava/lang/String;
    .end local v6    # "request":Ljava/lang/String;
    .end local v7    # "result":Z
    .restart local v2    # "in":Ljava/io/BufferedReader;
    :cond_5c
    :goto_5c
    return-void

    .line 593
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "index":I
    .restart local v6    # "request":Ljava/lang/String;
    :cond_5d
    const/4 v8, 0x0

    :try_start_5e
    invoke-virtual {v6, v8, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 594
    .restart local v0    # "command":Ljava/lang/String;
    add-int/lit8 v8, v4, 0x1

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "parameters":Ljava/lang/String;
    goto :goto_23

    .line 600
    :cond_69
    const-string v8, "SERVER"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_7a

    .line 601
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    const-string v9, "4"

    # invokes: Lorg/androidannotations/api/ViewServer;->writeValue(Ljava/net/Socket;Ljava/lang/String;)Z
    invoke-static {v8, v9}, Lorg/androidannotations/api/ViewServer;->access$200(Ljava/net/Socket;Ljava/lang/String;)Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 602
    .end local v7    # "result":Z
    :cond_7a
    const-string v8, "LIST"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_89

    .line 603
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-direct {p0, v8}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->listWindows(Ljava/net/Socket;)Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 604
    .end local v7    # "result":Z
    :cond_89
    const-string v8, "GET_FOCUS"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_98

    .line 605
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-direct {p0, v8}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->getFocusedWindow(Ljava/net/Socket;)Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 606
    .end local v7    # "result":Z
    :cond_98
    const-string v8, "AUTOLIST"

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_a5

    .line 607
    invoke-direct {p0}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->windowManagerAutolistLoop()Z

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 609
    .end local v7    # "result":Z
    :cond_a5
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-direct {p0, v8, v0, v5}, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->windowCommand(Ljava/net/Socket;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_aa
    .catch Ljava/io/IOException; {:try_start_5e .. :try_end_aa} :catch_f5
    .catchall {:try_start_5e .. :try_end_aa} :catchall_f2

    move-result v7

    .restart local v7    # "result":Z
    goto :goto_33

    .line 622
    :catch_ac
    move-exception v1

    .line 623
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_52

    .line 629
    .end local v1    # "e":Ljava/io/IOException;
    :catch_b1
    move-exception v1

    .line 630
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    move-object v2, v3

    .line 631
    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto :goto_5c

    .line 615
    .end local v0    # "command":Ljava/lang/String;
    .end local v1    # "e":Ljava/io/IOException;
    .end local v4    # "index":I
    .end local v5    # "parameters":Ljava/lang/String;
    .end local v6    # "request":Ljava/lang/String;
    .end local v7    # "result":Z
    :catch_b7
    move-exception v1

    .line 616
    .restart local v1    # "e":Ljava/io/IOException;
    :goto_b8
    :try_start_b8
    const-string v8, "ViewServer"

    const-string v9, "Connection error: "

    invoke-static {v8, v9, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_bf
    .catchall {:try_start_b8 .. :try_end_bf} :catchall_d8

    .line 618
    if-eqz v2, :cond_c4

    .line 620
    :try_start_c1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_c4
    .catch Ljava/io/IOException; {:try_start_c1 .. :try_end_c4} :catch_d3

    .line 626
    :cond_c4
    :goto_c4
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    if-eqz v8, :cond_5c

    .line 628
    :try_start_c8
    iget-object v8, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v8}, Ljava/net/Socket;->close()V
    :try_end_cd
    .catch Ljava/io/IOException; {:try_start_c8 .. :try_end_cd} :catch_ce

    goto :goto_5c

    .line 629
    :catch_ce
    move-exception v1

    .line 630
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_5c

    .line 622
    :catch_d3
    move-exception v1

    .line 623
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_c4

    .line 618
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_d8
    move-exception v8

    :goto_d9
    if-eqz v2, :cond_de

    .line 620
    :try_start_db
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_de
    .catch Ljava/io/IOException; {:try_start_db .. :try_end_de} :catch_e8

    .line 626
    :cond_de
    :goto_de
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    if-eqz v9, :cond_e7

    .line 628
    :try_start_e2
    iget-object v9, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mClient:Ljava/net/Socket;

    invoke-virtual {v9}, Ljava/net/Socket;->close()V
    :try_end_e7
    .catch Ljava/io/IOException; {:try_start_e2 .. :try_end_e7} :catch_ed

    .line 631
    :cond_e7
    :goto_e7
    throw v8

    .line 622
    :catch_e8
    move-exception v1

    .line 623
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_de

    .line 629
    .end local v1    # "e":Ljava/io/IOException;
    :catch_ed
    move-exception v1

    .line 630
    .restart local v1    # "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_e7

    .line 618
    .end local v1    # "e":Ljava/io/IOException;
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catchall_f2
    move-exception v8

    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto :goto_d9

    .line 615
    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    :catch_f5
    move-exception v1

    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto :goto_b8

    .end local v2    # "in":Ljava/io/BufferedReader;
    .restart local v0    # "command":Ljava/lang/String;
    .restart local v3    # "in":Ljava/io/BufferedReader;
    .restart local v4    # "index":I
    .restart local v5    # "parameters":Ljava/lang/String;
    .restart local v6    # "request":Ljava/lang/String;
    .restart local v7    # "result":Z
    :cond_f8
    move-object v2, v3

    .end local v3    # "in":Ljava/io/BufferedReader;
    .restart local v2    # "in":Ljava/io/BufferedReader;
    goto/16 :goto_5c
.end method

.method public windowsChanged()V
    .registers 3

    .prologue
    .line 799
    iget-object v1, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    monitor-enter v1

    .line 800
    const/4 v0, 0x1

    :try_start_4
    iput-boolean v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mNeedWindowListUpdate:Z

    .line 801
    iget-object v0, p0, Lorg/androidannotations/api/ViewServer$ViewServerWorker;->mLock:[Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 802
    monitor-exit v1

    .line 803
    return-void

    .line 802
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_4 .. :try_end_f} :catchall_d

    throw v0
.end method
