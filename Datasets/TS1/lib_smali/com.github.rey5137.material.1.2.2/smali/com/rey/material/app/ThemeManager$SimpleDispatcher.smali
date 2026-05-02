.class public Lcom/rey/material/app/ThemeManager$SimpleDispatcher;
.super Ljava/lang/Object;
.source "ThemeManager.java"

# interfaces
.implements Lcom/rey/material/app/ThemeManager$EventDispatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/rey/material/app/ThemeManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleDispatcher"
.end annotation


# instance fields
.field mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 218
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public dispatchThemeChanged(I)V
    .registers 6
    .param p1, "theme"    # I

    .prologue
    .line 246
    new-instance v0, Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;

    invoke-direct {v0, p1}, Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;-><init>(I)V

    .line 248
    .local v0, "event":Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_d
    if-ltz v1, :cond_2f

    .line 249
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 250
    .local v2, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_25

    .line 251
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 248
    :goto_22
    add-int/lit8 v1, v1, -0x1

    goto :goto_d

    .line 253
    :cond_25
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;

    invoke-interface {v3, v0}, Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;->onThemeChanged(Lcom/rey/material/app/ThemeManager$OnThemeChangedEvent;)V

    goto :goto_22

    .line 255
    .end local v2    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;>;"
    :cond_2f
    return-void
.end method

.method public registerListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V
    .registers 7
    .param p1, "listener"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;

    .prologue
    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "exist":Z
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .local v1, "i":I
    :goto_9
    if-ltz v1, :cond_29

    .line 224
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    .line 225
    .local v2, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;>;"
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_21

    .line 226
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 223
    :cond_1e
    :goto_1e
    add-int/lit8 v1, v1, -0x1

    goto :goto_9

    .line 227
    :cond_21
    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    if-ne v3, p1, :cond_1e

    .line 228
    const/4 v0, 0x1

    goto :goto_1e

    .line 231
    .end local v2    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;>;"
    :cond_29
    if-nez v0, :cond_35

    .line 232
    iget-object v3, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 233
    :cond_35
    return-void
.end method

.method public unregisterListener(Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;)V
    .registers 5
    .param p1, "listener"    # Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;

    .prologue
    .line 237
    iget-object v2, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_8
    if-ltz v0, :cond_26

    .line 238
    iget-object v2, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 239
    .local v1, "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1e

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_23

    .line 240
    :cond_1e
    iget-object v2, p0, Lcom/rey/material/app/ThemeManager$SimpleDispatcher;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 237
    :cond_23
    add-int/lit8 v0, v0, -0x1

    goto :goto_8

    .line 242
    .end local v1    # "ref":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/rey/material/app/ThemeManager$OnThemeChangedListener;>;"
    :cond_26
    return-void
.end method
