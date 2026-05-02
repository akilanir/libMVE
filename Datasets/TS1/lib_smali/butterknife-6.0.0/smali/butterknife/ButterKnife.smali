.class public final Lbutterknife/ButterKnife;
.super Ljava/lang/Object;
.source "ButterKnife.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lbutterknife/ButterKnife$Setter;,
        Lbutterknife/ButterKnife$Action;,
        Lbutterknife/ButterKnife$Finder;
    }
.end annotation


# static fields
.field static final INJECTORS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field static final NO_OP:Ljava/lang/reflect/Method;

.field static final RESETTERS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Class",
            "<*>;",
            "Ljava/lang/reflect/Method;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "ButterKnife"

.field private static debug:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 166
    const/4 v0, 0x0

    sput-boolean v0, Lbutterknife/ButterKnife;->debug:Z

    .line 168
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lbutterknife/ButterKnife;->INJECTORS:Ljava/util/Map;

    .line 169
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lbutterknife/ButterKnife;->RESETTERS:Ljava/util/Map;

    .line 170
    const/4 v0, 0x0

    sput-object v0, Lbutterknife/ButterKnife;->NO_OP:Ljava/lang/reflect/Method;

    return-void
.end method

.method private constructor <init>()V
    .registers 3

    .prologue
    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "No instances."

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public static apply(Ljava/util/List;Landroid/util/Property;Ljava/lang/Object;)V
    .registers 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Landroid/util/Property",
            "<-TT;TV;>;TV;)V"
        }
    .end annotation

    .prologue
    .line 353
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "setter":Landroid/util/Property;, "Landroid/util/Property<-TT;TV;>;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_5
    if-ge v1, v0, :cond_11

    .line 354
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2, p2}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 353
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 356
    :cond_11
    return-void
.end method

.method public static apply(Ljava/util/List;Lbutterknife/ButterKnife$Action;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Lbutterknife/ButterKnife$Action",
            "<-TT;>;)V"
        }
    .end annotation

    .prologue
    .line 334
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "action":Lbutterknife/ButterKnife$Action;, "Lbutterknife/ButterKnife$Action<-TT;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_5
    if-ge v1, v0, :cond_13

    .line 335
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {p1, v2, v1}, Lbutterknife/ButterKnife$Action;->apply(Landroid/view/View;I)V

    .line 334
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 337
    :cond_13
    return-void
.end method

.method public static apply(Ljava/util/List;Lbutterknife/ButterKnife$Setter;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TT;>;",
            "Lbutterknife/ButterKnife$Setter",
            "<-TT;TV;>;TV;)V"
        }
    .end annotation

    .prologue
    .line 341
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    .local p1, "setter":Lbutterknife/ButterKnife$Setter;, "Lbutterknife/ButterKnife$Setter<-TT;TV;>;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .local v0, "count":I
    :goto_5
    if-ge v1, v0, :cond_13

    .line 342
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-interface {p1, v2, p2, v1}, Lbutterknife/ButterKnife$Setter;->set(Landroid/view/View;Ljava/lang/Object;I)V

    .line 341
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 344
    :cond_13
    return-void
.end method

.method public static findById(Landroid/app/Activity;I)Landroid/view/View;
    .registers 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/app/Activity;",
            "I)TT;"
        }
    .end annotation

    .prologue
    .line 367
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static findById(Landroid/app/Dialog;I)Landroid/view/View;
    .registers 3
    .param p0, "dialog"    # Landroid/app/Dialog;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/app/Dialog;",
            "I)TT;"
        }
    .end annotation

    .prologue
    .line 373
    invoke-virtual {p0, p1}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public static findById(Landroid/view/View;I)Landroid/view/View;
    .registers 3
    .param p0, "view"    # Landroid/view/View;
    .param p1, "id"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            "I)TT;"
        }
    .end annotation

    .prologue
    .line 361
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method private static findInjectorForClass(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 287
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lbutterknife/ButterKnife;->INJECTORS:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 288
    .local v2, "inject":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_17

    .line 289
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_15

    const-string v4, "ButterKnife"

    const-string v5, "HIT: Cached in injector map."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_15
    move-object v4, v2

    .line 306
    :goto_16
    return-object v4

    .line 292
    :cond_17
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 293
    .local v0, "clsName":Ljava/lang/String;
    const-string v4, "android."

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2b

    const-string v4, "java."

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 294
    :cond_2b
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_36

    const-string v4, "ButterKnife"

    const-string v5, "MISS: Reached framework class. Abandoning search."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 295
    :cond_36
    sget-object v4, Lbutterknife/ButterKnife;->NO_OP:Ljava/lang/reflect/Method;

    goto :goto_16

    .line 298
    :cond_39
    :try_start_39
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "$$ViewInjector"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 299
    .local v3, "injector":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "inject"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Lbutterknife/ButterKnife$Finder;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    const-class v7, Ljava/lang/Object;

    aput-object v7, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 300
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_71

    const-string v4, "ButterKnife"

    const-string v5, "HIT: Class loaded injection class."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_71
    .catch Ljava/lang/ClassNotFoundException; {:try_start_39 .. :try_end_71} :catch_78

    .line 305
    .end local v3    # "injector":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_71
    :goto_71
    sget-object v4, Lbutterknife/ButterKnife;->INJECTORS:Ljava/util/Map;

    invoke-interface {v4, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v2

    .line 306
    goto :goto_16

    .line 301
    :catch_78
    move-exception v1

    .line 302
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_9d

    const-string v4, "ButterKnife"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not found. Trying superclass "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    :cond_9d
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lbutterknife/ButterKnife;->findInjectorForClass(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    goto :goto_71
.end method

.method private static findResettersForClass(Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 310
    .local p0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v4, Lbutterknife/ButterKnife;->RESETTERS:Ljava/util/Map;

    invoke-interface {v4, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 311
    .local v2, "inject":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_17

    .line 312
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_15

    const-string v4, "ButterKnife"

    const-string v5, "HIT: Cached in injector map."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_15
    move-object v4, v2

    .line 329
    :goto_16
    return-object v4

    .line 315
    :cond_17
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 316
    .local v0, "clsName":Ljava/lang/String;
    const-string v4, "android."

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2b

    const-string v4, "java."

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_39

    .line 317
    :cond_2b
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_36

    const-string v4, "ButterKnife"

    const-string v5, "MISS: Reached framework class. Abandoning search."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 318
    :cond_36
    sget-object v4, Lbutterknife/ButterKnife;->NO_OP:Ljava/lang/reflect/Method;

    goto :goto_16

    .line 321
    :cond_39
    :try_start_39
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "$$ViewInjector"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 322
    .local v3, "injector":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "reset"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 323
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_67

    const-string v4, "ButterKnife"

    const-string v5, "HIT: Class loaded injection class."

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_67
    .catch Ljava/lang/ClassNotFoundException; {:try_start_39 .. :try_end_67} :catch_6e

    .line 328
    .end local v3    # "injector":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_67
    :goto_67
    sget-object v4, Lbutterknife/ButterKnife;->RESETTERS:Ljava/util/Map;

    invoke-interface {v4, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v4, v2

    .line 329
    goto :goto_16

    .line 324
    :catch_6e
    move-exception v1

    .line 325
    .local v1, "e":Ljava/lang/ClassNotFoundException;
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_93

    const-string v4, "ButterKnife"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not found. Trying superclass "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 326
    :cond_93
    invoke-virtual {p0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v4

    invoke-static {v4}, Lbutterknife/ButterKnife;->findResettersForClass(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    goto :goto_67
.end method

.method public static inject(Landroid/app/Activity;)V
    .registers 2
    .param p0, "target"    # Landroid/app/Activity;

    .prologue
    .line 184
    sget-object v0, Lbutterknife/ButterKnife$Finder;->ACTIVITY:Lbutterknife/ButterKnife$Finder;

    invoke-static {p0, p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V

    .line 185
    return-void
.end method

.method public static inject(Landroid/app/Dialog;)V
    .registers 2
    .param p0, "target"    # Landroid/app/Dialog;

    .prologue
    .line 204
    sget-object v0, Lbutterknife/ButterKnife$Finder;->DIALOG:Lbutterknife/ButterKnife$Finder;

    invoke-static {p0, p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V

    .line 205
    return-void
.end method

.method public static inject(Landroid/view/View;)V
    .registers 2
    .param p0, "target"    # Landroid/view/View;

    .prologue
    .line 194
    sget-object v0, Lbutterknife/ButterKnife$Finder;->VIEW:Lbutterknife/ButterKnife$Finder;

    invoke-static {p0, p0, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V

    .line 195
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/app/Activity;)V
    .registers 3
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "source"    # Landroid/app/Activity;

    .prologue
    .line 215
    sget-object v0, Lbutterknife/ButterKnife$Finder;->ACTIVITY:Lbutterknife/ButterKnife$Finder;

    invoke-static {p0, p1, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V

    .line 216
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/app/Dialog;)V
    .registers 3
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "source"    # Landroid/app/Dialog;

    .prologue
    .line 237
    sget-object v0, Lbutterknife/ButterKnife$Finder;->DIALOG:Lbutterknife/ButterKnife$Finder;

    invoke-static {p0, p1, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V

    .line 238
    return-void
.end method

.method public static inject(Ljava/lang/Object;Landroid/view/View;)V
    .registers 3
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "source"    # Landroid/view/View;

    .prologue
    .line 226
    sget-object v0, Lbutterknife/ButterKnife$Finder;->VIEW:Lbutterknife/ButterKnife$Finder;

    invoke-static {p0, p1, v0}, Lbutterknife/ButterKnife;->inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V

    .line 227
    return-void
.end method

.method static inject(Ljava/lang/Object;Ljava/lang/Object;Lbutterknife/ButterKnife$Finder;)V
    .registers 10
    .param p0, "target"    # Ljava/lang/Object;
    .param p1, "source"    # Ljava/lang/Object;
    .param p2, "finder"    # Lbutterknife/ButterKnife$Finder;

    .prologue
    .line 268
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 270
    .local v3, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_4
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_24

    const-string v4, "ButterKnife"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Looking up view injector for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    :cond_24
    invoke-static {v3}, Lbutterknife/ButterKnife;->findInjectorForClass(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 272
    .local v1, "inject":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_3a

    .line 273
    const/4 v4, 0x0

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 v6, 0x2

    aput-object p1, v5, v6

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3a
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_3a} :catch_3b
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_3a} :catch_3d

    .line 284
    :cond_3a
    return-void

    .line 275
    .end local v1    # "inject":Ljava/lang/reflect/Method;
    :catch_3b
    move-exception v0

    .line 276
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 277
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_3d
    move-exception v0

    .line 278
    .local v0, "e":Ljava/lang/Exception;
    move-object v2, v0

    .line 279
    .local v2, "t":Ljava/lang/Throwable;
    instance-of v4, v2, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v4, :cond_47

    .line 280
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 282
    :cond_47
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to inject views for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static reset(Ljava/lang/Object;)V
    .registers 8
    .param p0, "target"    # Ljava/lang/Object;

    .prologue
    .line 249
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 251
    .local v3, "targetClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_4
    sget-boolean v4, Lbutterknife/ButterKnife;->debug:Z

    if-eqz v4, :cond_24

    const-string v4, "ButterKnife"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Looking up view injector for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    :cond_24
    invoke-static {v3}, Lbutterknife/ButterKnife;->findResettersForClass(Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 253
    .local v1, "reset":Ljava/lang/reflect/Method;
    if-eqz v1, :cond_34

    .line 254
    const/4 v4, 0x0

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    invoke-virtual {v1, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_34
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_34} :catch_35
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_34} :catch_37

    .line 265
    :cond_34
    return-void

    .line 256
    .end local v1    # "reset":Ljava/lang/reflect/Method;
    :catch_35
    move-exception v0

    .line 257
    .local v0, "e":Ljava/lang/RuntimeException;
    throw v0

    .line 258
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :catch_37
    move-exception v0

    .line 259
    .local v0, "e":Ljava/lang/Exception;
    move-object v2, v0

    .line 260
    .local v2, "t":Ljava/lang/Throwable;
    instance-of v4, v2, Ljava/lang/reflect/InvocationTargetException;

    if-eqz v4, :cond_41

    .line 261
    invoke-virtual {v2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 263
    :cond_41
    new-instance v4, Ljava/lang/RuntimeException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unable to reset views for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method public static setDebug(Z)V
    .registers 1
    .param p0, "debug"    # Z

    .prologue
    .line 174
    sput-boolean p0, Lbutterknife/ButterKnife;->debug:Z

    .line 175
    return-void
.end method
