.class public Lorg/junit/experimental/categories/Categories$CategoryFilter;
.super Lorg/junit/runner/manipulation/Filter;
.source "Categories.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/categories/Categories;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CategoryFilter"
.end annotation


# instance fields
.field private final excluded:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final excludedAny:Z

.field private final included:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final includedAny:Z


# direct methods
.method protected constructor <init>(ZLjava/util/Set;ZLjava/util/Set;)V
    .registers 6
    .param p1, "matchAnyIncludes"    # Z
    .param p3, "matchAnyExcludes"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;Z",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)V"
        }
    .end annotation

    .prologue
    .line 155
    .local p2, "includes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    .local p4, "excludes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-direct {p0}, Lorg/junit/runner/manipulation/Filter;-><init>()V

    .line 156
    iput-boolean p1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->includedAny:Z

    .line 157
    iput-boolean p3, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excludedAny:Z

    .line 158
    invoke-static {p2}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->copyAndRefine(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    .line 159
    invoke-static {p4}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->copyAndRefine(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excluded:Ljava/util/Set;

    .line 160
    return-void
.end method

.method private static categories(Lorg/junit/runner/Description;)Ljava/util/Set;
    .registers 3
    .param p0, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 266
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 267
    .local v0, "categories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-static {p0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->directCategories(Lorg/junit/runner/Description;)[Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 268
    invoke-static {p0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->parentDescription(Lorg/junit/runner/Description;)Lorg/junit/runner/Description;

    move-result-object v1

    invoke-static {v1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->directCategories(Lorg/junit/runner/Description;)[Ljava/lang/Class;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 269
    return-object v0
.end method

.method public static categoryFilter(ZLjava/util/Set;ZLjava/util/Set;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 5
    .param p0, "matchAnyInclusions"    # Z
    .param p2, "matchAnyExclusions"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;Z",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .line 151
    .local p1, "inclusions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    .local p3, "exclusions":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    new-instance v0, Lorg/junit/experimental/categories/Categories$CategoryFilter;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/junit/experimental/categories/Categories$CategoryFilter;-><init>(ZLjava/util/Set;ZLjava/util/Set;)V

    return-object v0
.end method

.method private static copyAndRefine(Ljava/util/Set;)Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 287
    .local p0, "classes":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 288
    .local v0, "c":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Class<*>;>;"
    if-eqz p0, :cond_a

    .line 289
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 291
    :cond_a
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 292
    return-object v0
.end method

.method private static directCategories(Lorg/junit/runner/Description;)[Ljava/lang/Class;
    .registers 4
    .param p0, "description"    # Lorg/junit/runner/Description;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/junit/runner/Description;",
            ")[",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 278
    if-nez p0, :cond_6

    .line 279
    new-array v1, v2, [Ljava/lang/Class;

    .line 283
    :goto_5
    return-object v1

    .line 282
    :cond_6
    const-class v1, Lorg/junit/experimental/categories/Category;

    invoke-virtual {p0, v1}, Lorg/junit/runner/Description;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lorg/junit/experimental/categories/Category;

    .line 283
    .local v0, "annotation":Lorg/junit/experimental/categories/Category;
    if-nez v0, :cond_13

    new-array v1, v2, [Ljava/lang/Class;

    goto :goto_5

    :cond_13
    invoke-interface {v0}, Lorg/junit/experimental/categories/Category;->value()[Ljava/lang/Class;

    move-result-object v1

    goto :goto_5
.end method

.method public static exclude(Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .local p0, "category":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    .line 142
    new-array v0, v2, [Ljava/lang/Class;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v2, v0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->exclude(Z[Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;

    move-result-object v0

    return-object v0
.end method

.method public static varargs exclude(Z[Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 5
    .param p0, "matchAny"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "categories":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->hasNull([Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 136
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "has null category"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 138
    :cond_e
    const/4 v0, 0x1

    const/4 v1, 0x0

    # invokes: Lorg/junit/experimental/categories/Categories;->createSet([Ljava/lang/Class;)Ljava/util/Set;
    invoke-static {p1}, Lorg/junit/experimental/categories/Categories;->access$000([Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v2

    invoke-static {v0, v1, p0, v2}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->categoryFilter(ZLjava/util/Set;ZLjava/util/Set;)Lorg/junit/experimental/categories/Categories$CategoryFilter;

    move-result-object v0

    return-object v0
.end method

.method public static varargs exclude([Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .line 146
    .local p0, "categories":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    invoke-static {v0, p0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->exclude(Z[Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;

    move-result-object v0

    return-object v0
.end method

.method private hasCorrectCategoryAnnotation(Lorg/junit/runner/Description;)Z
    .registers 5
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    const/4 v1, 0x0

    .line 208
    invoke-static {p1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->categories(Lorg/junit/runner/Description;)Ljava/util/Set;

    move-result-object v0

    .line 211
    .local v0, "childCategories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_12

    .line 212
    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    .line 234
    :cond_11
    :goto_11
    return v1

    .line 215
    :cond_12
    iget-object v2, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excluded:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_26

    .line 216
    iget-boolean v2, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excludedAny:Z

    if-eqz v2, :cond_30

    .line 217
    iget-object v2, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excluded:Ljava/util/Set;

    invoke-direct {p0, v0, v2}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->matchesAnyParentCategories(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v2

    if-nez v2, :cond_11

    .line 227
    :cond_26
    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 229
    const/4 v1, 0x1

    goto :goto_11

    .line 221
    :cond_30
    iget-object v2, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excluded:Ljava/util/Set;

    invoke-direct {p0, v0, v2}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->matchesAllParentCategories(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v2

    if-eqz v2, :cond_26

    goto :goto_11

    .line 231
    :cond_39
    iget-boolean v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->includedAny:Z

    if-eqz v1, :cond_44

    .line 232
    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    invoke-direct {p0, v0, v1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->matchesAnyParentCategories(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v1

    goto :goto_11

    .line 234
    :cond_44
    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    invoke-direct {p0, v0, v1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->matchesAllParentCategories(Ljava/util/Set;Ljava/util/Set;)Z

    move-result v1

    goto :goto_11
.end method

.method private static varargs hasNull([Ljava/lang/Class;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .local p0, "classes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v4, 0x0

    .line 296
    if-nez p0, :cond_4

    .line 302
    :cond_3
    :goto_3
    return v4

    .line 297
    :cond_4
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Class;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_7
    if-ge v2, v3, :cond_3

    aget-object v1, v0, v2

    .line 298
    .local v1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v1, :cond_f

    .line 299
    const/4 v4, 0x1

    goto :goto_3

    .line 297
    :cond_f
    add-int/lit8 v2, v2, 0x1

    goto :goto_7
.end method

.method public static include(Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .local p0, "category":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v2, 0x1

    .line 127
    new-array v0, v2, [Ljava/lang/Class;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    invoke-static {v2, v0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->include(Z[Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;

    move-result-object v0

    return-object v0
.end method

.method public static varargs include(Z[Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 5
    .param p0, "matchAny"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z[",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "categories":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-static {p1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->hasNull([Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 121
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "has null category"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 123
    :cond_e
    # invokes: Lorg/junit/experimental/categories/Categories;->createSet([Ljava/lang/Class;)Ljava/util/Set;
    invoke-static {p1}, Lorg/junit/experimental/categories/Categories;->access$000([Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->categoryFilter(ZLjava/util/Set;ZLjava/util/Set;)Lorg/junit/experimental/categories/Categories$CategoryFilter;

    move-result-object v0

    return-object v0
.end method

.method public static varargs include([Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/junit/experimental/categories/Categories$CategoryFilter;"
        }
    .end annotation

    .prologue
    .line 131
    .local p0, "categories":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    invoke-static {v0, p0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->include(Z[Ljava/lang/Class;)Lorg/junit/experimental/categories/Categories$CategoryFilter;

    move-result-object v0

    return-object v0
.end method

.method private matchesAllParentCategories(Ljava/util/Set;Ljava/util/Set;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)Z"
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "childCategories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    .local p2, "parentCategories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 258
    .local v1, "parentCategory":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    # invokes: Lorg/junit/experimental/categories/Categories;->hasAssignableTo(Ljava/util/Set;Ljava/lang/Class;)Z
    invoke-static {p1, v1}, Lorg/junit/experimental/categories/Categories;->access$100(Ljava/util/Set;Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 259
    const/4 v2, 0x0

    .line 262
    .end local v1    # "parentCategory":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_17
    return v2

    :cond_18
    const/4 v2, 0x1

    goto :goto_17
.end method

.method private matchesAnyParentCategories(Ljava/util/Set;Ljava/util/Set;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Class",
            "<*>;>;)Z"
        }
    .end annotation

    .prologue
    .line 244
    .local p1, "childCategories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    .local p2, "parentCategories":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<*>;>;"
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 245
    .local v1, "parentCategory":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    # invokes: Lorg/junit/experimental/categories/Categories;->hasAssignableTo(Ljava/util/Set;Ljava/lang/Class;)Z
    invoke-static {p1, v1}, Lorg/junit/experimental/categories/Categories;->access$100(Ljava/util/Set;Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 246
    const/4 v2, 0x1

    .line 249
    .end local v1    # "parentCategory":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_17
    return v2

    :cond_18
    const/4 v2, 0x0

    goto :goto_17
.end method

.method private static parentDescription(Lorg/junit/runner/Description;)Lorg/junit/runner/Description;
    .registers 3
    .param p0, "description"    # Lorg/junit/runner/Description;

    .prologue
    .line 273
    invoke-virtual {p0}, Lorg/junit/runner/Description;->getTestClass()Ljava/lang/Class;

    move-result-object v0

    .line 274
    .local v0, "testClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_8

    const/4 v1, 0x0

    :goto_7
    return-object v1

    :cond_8
    invoke-static {v0}, Lorg/junit/runner/Description;->createSuiteDescription(Ljava/lang/Class;)Lorg/junit/runner/Description;

    move-result-object v1

    goto :goto_7
.end method


# virtual methods
.method public describe()Ljava/lang/String;
    .registers 2

    .prologue
    .line 167
    invoke-virtual {p0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public shouldRun(Lorg/junit/runner/Description;)Z
    .registers 6
    .param p1, "description"    # Lorg/junit/runner/Description;

    .prologue
    const/4 v2, 0x1

    .line 194
    invoke-direct {p0, p1}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->hasCorrectCategoryAnnotation(Lorg/junit/runner/Description;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 204
    :goto_7
    return v2

    .line 198
    :cond_8
    invoke-virtual {p1}, Lorg/junit/runner/Description;->getChildren()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/junit/runner/Description;

    .line 199
    .local v0, "each":Lorg/junit/runner/Description;
    invoke-virtual {p0, v0}, Lorg/junit/experimental/categories/Categories$CategoryFilter;->shouldRun(Lorg/junit/runner/Description;)Z

    move-result v3

    if-eqz v3, :cond_10

    goto :goto_7

    .line 204
    .end local v0    # "each":Lorg/junit/runner/Description;
    :cond_23
    const/4 v2, 0x0

    goto :goto_7
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 184
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v1, "categories "

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_2d

    const-string v1, "[all]"

    :goto_11
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 186
    .local v0, "description":Ljava/lang/StringBuilder;
    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excluded:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_28

    .line 187
    const-string v1, " - "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->excluded:Ljava/util/Set;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 189
    :cond_28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 184
    .end local v0    # "description":Ljava/lang/StringBuilder;
    :cond_2d
    iget-object v1, p0, Lorg/junit/experimental/categories/Categories$CategoryFilter;->included:Ljava/util/Set;

    goto :goto_11
.end method
