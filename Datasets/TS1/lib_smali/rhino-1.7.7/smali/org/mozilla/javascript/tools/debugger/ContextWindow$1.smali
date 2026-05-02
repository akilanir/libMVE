.class Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;
.super Ljava/lang/Object;
.source "SwingGui.java"

# interfaces
.implements Ljava/awt/event/ComponentListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/mozilla/javascript/tools/debugger/ContextWindow;-><init>(Lorg/mozilla/javascript/tools/debugger/SwingGui;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field t2Docked:Z

.field final synthetic this$0:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

.field final synthetic val$debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

.field final synthetic val$finalP1:Ljavax/swing/JPanel;

.field final synthetic val$finalP2:Ljavax/swing/JPanel;

.field final synthetic val$finalSplit:Ljavax/swing/JSplitPane;

.field final synthetic val$finalT1:Ljavax/swing/JToolBar;

.field final synthetic val$finalT2:Ljavax/swing/JToolBar;

.field final synthetic val$finalThis:Ljavax/swing/JPanel;


# direct methods
.method constructor <init>(Lorg/mozilla/javascript/tools/debugger/ContextWindow;Ljavax/swing/JPanel;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Lorg/mozilla/javascript/tools/debugger/SwingGui;Ljavax/swing/JToolBar;Ljavax/swing/JPanel;Ljavax/swing/JSplitPane;)V
    .registers 10

    .prologue
    .line 2964
    iput-object p1, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->this$0:Lorg/mozilla/javascript/tools/debugger/ContextWindow;

    iput-object p2, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalThis:Ljavax/swing/JPanel;

    iput-object p3, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalT1:Ljavax/swing/JToolBar;

    iput-object p4, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalP1:Ljavax/swing/JPanel;

    iput-object p5, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    iput-object p6, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalT2:Ljavax/swing/JToolBar;

    iput-object p7, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalP2:Ljavax/swing/JPanel;

    iput-object p8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2965
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->t2Docked:Z

    return-void
.end method


# virtual methods
.method check(Ljava/awt/Component;)V
    .registers 13
    .param p1, "comp"    # Ljava/awt/Component;

    .prologue
    .line 2967
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalThis:Ljavax/swing/JPanel;

    invoke-virtual {v8}, Ljavax/swing/JPanel;->getParent()Ljava/awt/Container;

    move-result-object v7

    .line 2968
    .local v7, "thisParent":Ljava/awt/Component;
    if-nez v7, :cond_9

    .line 3053
    :cond_8
    :goto_8
    return-void

    .line 2971
    :cond_9
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalT1:Ljavax/swing/JToolBar;

    invoke-virtual {v8}, Ljavax/swing/JToolBar;->getParent()Ljava/awt/Container;

    move-result-object v4

    .line 2972
    .local v4, "parent":Ljava/awt/Component;
    const/4 v3, 0x1

    .line 2973
    .local v3, "leftDocked":Z
    const/4 v5, 0x1

    .line 2974
    .local v5, "rightDocked":Z
    const/4 v0, 0x0

    .line 2975
    .local v0, "adjustVerticalSplit":Z
    if-eqz v4, :cond_50

    .line 2976
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalP1:Ljavax/swing/JPanel;

    if-eq v4, v8, :cond_65

    .line 2977
    :goto_18
    instance-of v8, v4, Ljavax/swing/JFrame;

    if-nez v8, :cond_21

    .line 2978
    invoke-virtual {v4}, Ljava/awt/Component;->getParent()Ljava/awt/Container;

    move-result-object v4

    goto :goto_18

    :cond_21
    move-object v1, v4

    .line 2980
    check-cast v1, Ljavax/swing/JFrame;

    .line 2981
    .local v1, "frame":Ljavax/swing/JFrame;
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    const-string v9, "Variables"

    invoke-virtual {v8, v9, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->addTopLevel(Ljava/lang/String;Ljavax/swing/JFrame;)V

    .line 2996
    invoke-virtual {v1}, Ljavax/swing/JFrame;->isResizable()Z

    move-result v8

    if-nez v8, :cond_4f

    .line 2997
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljavax/swing/JFrame;->setResizable(Z)V

    .line 2998
    const/4 v8, 0x0

    invoke-virtual {v1, v8}, Ljavax/swing/JFrame;->setDefaultCloseOperation(I)V

    .line 2999
    const-class v8, Ljava/awt/event/WindowListener;

    invoke-virtual {v1, v8}, Ljavax/swing/JFrame;->getListeners(Ljava/lang/Class;)[Ljava/util/EventListener;

    move-result-object v2

    check-cast v2, [Ljava/awt/event/WindowListener;

    .line 3001
    .local v2, "l":[Ljava/awt/event/WindowListener;
    const/4 v8, 0x0

    aget-object v8, v2, v8

    invoke-virtual {v1, v8}, Ljavax/swing/JFrame;->removeWindowListener(Ljava/awt/event/WindowListener;)V

    .line 3002
    new-instance v8, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1$1;

    invoke-direct {v8, p0, v2}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1$1;-><init>(Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;[Ljava/awt/event/WindowListener;)V

    invoke-virtual {v1, v8}, Ljavax/swing/JFrame;->addWindowListener(Ljava/awt/event/WindowListener;)V

    .line 3011
    .end local v2    # "l":[Ljava/awt/event/WindowListener;
    :cond_4f
    const/4 v3, 0x0

    .line 3016
    .end local v1    # "frame":Ljavax/swing/JFrame;
    :cond_50
    :goto_50
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalT2:Ljavax/swing/JToolBar;

    invoke-virtual {v8}, Ljavax/swing/JToolBar;->getParent()Ljava/awt/Container;

    move-result-object v4

    .line 3017
    if-eqz v4, :cond_76

    .line 3018
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalP2:Ljavax/swing/JPanel;

    if-eq v4, v8, :cond_9e

    .line 3019
    :goto_5c
    instance-of v8, v4, Ljavax/swing/JFrame;

    if-nez v8, :cond_67

    .line 3020
    invoke-virtual {v4}, Ljava/awt/Component;->getParent()Ljava/awt/Container;

    move-result-object v4

    goto :goto_5c

    .line 3013
    :cond_65
    const/4 v3, 0x1

    goto :goto_50

    :cond_67
    move-object v1, v4

    .line 3022
    check-cast v1, Ljavax/swing/JFrame;

    .line 3023
    .restart local v1    # "frame":Ljavax/swing/JFrame;
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$debugGui:Lorg/mozilla/javascript/tools/debugger/SwingGui;

    const-string v9, "Evaluate"

    invoke-virtual {v8, v9, v1}, Lorg/mozilla/javascript/tools/debugger/SwingGui;->addTopLevel(Ljava/lang/String;Ljavax/swing/JFrame;)V

    .line 3024
    const/4 v8, 0x1

    invoke-virtual {v1, v8}, Ljavax/swing/JFrame;->setResizable(Z)V

    .line 3025
    const/4 v5, 0x0

    .line 3030
    .end local v1    # "frame":Ljavax/swing/JFrame;
    :cond_76
    :goto_76
    if-eqz v3, :cond_82

    iget-boolean v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->t2Docked:Z

    if-eqz v8, :cond_82

    if-eqz v5, :cond_82

    iget-boolean v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->t2Docked:Z

    if-nez v8, :cond_8

    .line 3034
    :cond_82
    iput-boolean v5, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->t2Docked:Z

    move-object v6, v7

    .line 3035
    check-cast v6, Ljavax/swing/JSplitPane;

    .line 3036
    .local v6, "split":Ljavax/swing/JSplitPane;
    if-eqz v3, :cond_a8

    .line 3037
    if-eqz v5, :cond_a0

    .line 3038
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/high16 v9, 0x3fe0000000000000L    # 0.5

    invoke-virtual {v8, v9, v10}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3042
    :goto_92
    if-eqz v0, :cond_8

    .line 3043
    const-wide v8, 0x3fe51eb851eb851fL    # 0.66

    invoke-virtual {v6, v8, v9}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto/16 :goto_8

    .line 3027
    .end local v6    # "split":Ljavax/swing/JSplitPane;
    :cond_9e
    const/4 v5, 0x1

    goto :goto_76

    .line 3040
    .restart local v6    # "split":Ljavax/swing/JSplitPane;
    :cond_a0
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/high16 v9, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v8, v9, v10}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto :goto_92

    .line 3046
    :cond_a8
    if-eqz v5, :cond_bb

    .line 3047
    iget-object v8, p0, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->val$finalSplit:Ljavax/swing/JSplitPane;

    const-wide/16 v9, 0x0

    invoke-virtual {v8, v9, v10}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    .line 3048
    const-wide v8, 0x3fe51eb851eb851fL    # 0.66

    invoke-virtual {v6, v8, v9}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto/16 :goto_8

    .line 3051
    :cond_bb
    const-wide/high16 v8, 0x3ff0000000000000L    # 1.0

    invoke-virtual {v6, v8, v9}, Ljavax/swing/JSplitPane;->setDividerLocation(D)V

    goto/16 :goto_8
.end method

.method public componentHidden(Ljava/awt/event/ComponentEvent;)V
    .registers 3
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .prologue
    .line 3055
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3056
    return-void
.end method

.method public componentMoved(Ljava/awt/event/ComponentEvent;)V
    .registers 3
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .prologue
    .line 3058
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3059
    return-void
.end method

.method public componentResized(Ljava/awt/event/ComponentEvent;)V
    .registers 3
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .prologue
    .line 3061
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3062
    return-void
.end method

.method public componentShown(Ljava/awt/event/ComponentEvent;)V
    .registers 3
    .param p1, "e"    # Ljava/awt/event/ComponentEvent;

    .prologue
    .line 3064
    invoke-virtual {p1}, Ljava/awt/event/ComponentEvent;->getComponent()Ljava/awt/Component;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/mozilla/javascript/tools/debugger/ContextWindow$1;->check(Ljava/awt/Component;)V

    .line 3065
    return-void
.end method
