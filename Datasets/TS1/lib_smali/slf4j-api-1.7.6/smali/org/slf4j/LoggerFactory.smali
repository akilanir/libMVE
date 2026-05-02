.class public final Lorg/slf4j/LoggerFactory;
.super Ljava/lang/Object;
.source "LoggerFactory.java"


# static fields
.field private static final API_COMPATIBILITY_LIST:[Ljava/lang/String;

.field static final CODES_PREFIX:Ljava/lang/String; = "http://www.slf4j.org/codes.html"

.field static final FAILED_INITIALIZATION:I = 0x2

.field static INITIALIZATION_STATE:I = 0x0

.field static final MULTIPLE_BINDINGS_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#multiple_bindings"

.field static NOP_FALLBACK_FACTORY:Lorg/slf4j/helpers/NOPLoggerFactory; = null

.field static final NOP_FALLBACK_INITIALIZATION:I = 0x4

.field static final NO_STATICLOGGERBINDER_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#StaticLoggerBinder"

.field static final NULL_LF_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#null_LF"

.field static final ONGOING_INITIALIZATION:I = 0x1

.field private static STATIC_LOGGER_BINDER_PATH:Ljava/lang/String; = null

.field static final SUBSTITUTE_LOGGER_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#substituteLogger"

.field static final SUCCESSFUL_INITIALIZATION:I = 0x3

.field static TEMP_FACTORY:Lorg/slf4j/helpers/SubstituteLoggerFactory; = null

.field static final UNINITIALIZED:I = 0x0

.field static final UNSUCCESSFUL_INIT_MSG:Ljava/lang/String; = "org.slf4j.LoggerFactory could not be successfully initialized. See also http://www.slf4j.org/codes.html#unsuccessfulInit"

.field static final UNSUCCESSFUL_INIT_URL:Ljava/lang/String; = "http://www.slf4j.org/codes.html#unsuccessfulInit"

.field static final VERSION_MISMATCH:Ljava/lang/String; = "http://www.slf4j.org/codes.html#version_mismatch"


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 74
    sput v2, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 75
    new-instance v0, Lorg/slf4j/helpers/SubstituteLoggerFactory;

    invoke-direct {v0}, Lorg/slf4j/helpers/SubstituteLoggerFactory;-><init>()V

    sput-object v0, Lorg/slf4j/LoggerFactory;->TEMP_FACTORY:Lorg/slf4j/helpers/SubstituteLoggerFactory;

    .line 76
    new-instance v0, Lorg/slf4j/helpers/NOPLoggerFactory;

    invoke-direct {v0}, Lorg/slf4j/helpers/NOPLoggerFactory;-><init>()V

    sput-object v0, Lorg/slf4j/LoggerFactory;->NOP_FALLBACK_FACTORY:Lorg/slf4j/helpers/NOPLoggerFactory;

    .line 85
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "1.6"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v2, "1.7"

    aput-object v2, v0, v1

    sput-object v0, Lorg/slf4j/LoggerFactory;->API_COMPATIBILITY_LIST:[Ljava/lang/String;

    .line 214
    const-string v0, "org/slf4j/impl/StaticLoggerBinder.class"

    sput-object v0, Lorg/slf4j/LoggerFactory;->STATIC_LOGGER_BINDER_PATH:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    return-void
.end method

.method private static final bind()V
    .registers 7

    .prologue
    .line 126
    :try_start_0
    invoke-static {}, Lorg/slf4j/LoggerFactory;->findPossibleStaticLoggerBinderPathSet()Ljava/util/Set;

    move-result-object v4

    .line 127
    .local v4, "staticLoggerBinderPathSet":Ljava/util/Set;
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->reportMultipleBindingAmbiguity(Ljava/util/Set;)V

    .line 129
    invoke-static {}, Lorg/slf4j/impl/StaticLoggerBinder;->getSingleton()Lorg/slf4j/impl/StaticLoggerBinder;

    .line 130
    const/4 v5, 0x3

    sput v5, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 131
    invoke-static {v4}, Lorg/slf4j/LoggerFactory;->reportActualBinding(Ljava/util/Set;)V

    .line 132
    invoke-static {}, Lorg/slf4j/LoggerFactory;->fixSubstitutedLoggers()V
    :try_end_13
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_0 .. :try_end_13} :catch_14
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_13} :catch_36
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_13} :catch_59

    .line 158
    :goto_13
    return-void

    .line 133
    :catch_14
    move-exception v2

    .line 134
    .local v2, "ncde":Ljava/lang/NoClassDefFoundError;
    invoke-virtual {v2}, Ljava/lang/NoClassDefFoundError;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 135
    .local v1, "msg":Ljava/lang/String;
    invoke-static {v1}, Lorg/slf4j/LoggerFactory;->messageContainsOrgSlf4jImplStaticLoggerBinder(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_32

    .line 136
    const/4 v5, 0x4

    sput v5, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 137
    const-string v5, "Failed to load class \"org.slf4j.impl.StaticLoggerBinder\"."

    invoke-static {v5}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 138
    const-string v5, "Defaulting to no-operation (NOP) logger implementation"

    invoke-static {v5}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 139
    const-string v5, "See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details."

    invoke-static {v5}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    goto :goto_13

    .line 142
    :cond_32
    invoke-static {v2}, Lorg/slf4j/LoggerFactory;->failedBinding(Ljava/lang/Throwable;)V

    .line 143
    throw v2

    .line 145
    .end local v1    # "msg":Ljava/lang/String;
    .end local v2    # "ncde":Ljava/lang/NoClassDefFoundError;
    :catch_36
    move-exception v3

    .line 146
    .local v3, "nsme":Ljava/lang/NoSuchMethodError;
    invoke-virtual {v3}, Ljava/lang/NoSuchMethodError;->getMessage()Ljava/lang/String;

    move-result-object v1

    .line 147
    .restart local v1    # "msg":Ljava/lang/String;
    if-eqz v1, :cond_58

    const-string v5, "org.slf4j.impl.StaticLoggerBinder.getSingleton()"

    invoke-virtual {v1, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_58

    .line 148
    const/4 v5, 0x2

    sput v5, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 149
    const-string v5, "slf4j-api 1.6.x (or later) is incompatible with this binding."

    invoke-static {v5}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 150
    const-string v5, "Your binding is version 1.5.5 or earlier."

    invoke-static {v5}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 151
    const-string v5, "Upgrade your binding to version 1.6.x."

    invoke-static {v5}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 153
    :cond_58
    throw v3

    .line 154
    .end local v1    # "msg":Ljava/lang/String;
    .end local v3    # "nsme":Ljava/lang/NoSuchMethodError;
    :catch_59
    move-exception v0

    .line 155
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->failedBinding(Ljava/lang/Throwable;)V

    .line 156
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Unexpected initialization failure"

    invoke-direct {v5, v6, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method static failedBinding(Ljava/lang/Throwable;)V
    .registers 2
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 161
    const/4 v0, 0x2

    sput v0, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 162
    const-string v0, "Failed to instantiate SLF4J LoggerFactory"

    invoke-static {v0, p0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 163
    return-void
.end method

.method private static findPossibleStaticLoggerBinderPathSet()Ljava/util/Set;
    .registers 6

    .prologue
    .line 219
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 221
    .local v4, "staticLoggerBinderPathSet":Ljava/util/Set;
    :try_start_5
    const-class v5, Lorg/slf4j/LoggerFactory;

    invoke-virtual {v5}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    .line 224
    .local v1, "loggerFactoryClassLoader":Ljava/lang/ClassLoader;
    if-nez v1, :cond_2a

    .line 225
    sget-object v5, Lorg/slf4j/LoggerFactory;->STATIC_LOGGER_BINDER_PATH:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/ClassLoader;->getSystemResources(Ljava/lang/String;)Ljava/util/Enumeration;

    move-result-object v3

    .line 230
    .local v3, "paths":Ljava/util/Enumeration;
    :goto_13
    invoke-interface {v3}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v5

    if-eqz v5, :cond_29

    .line 231
    invoke-interface {v3}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/URL;

    .line 232
    .local v2, "path":Ljava/net/URL;
    invoke-interface {v4, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_22} :catch_23

    goto :goto_13

    .line 234
    .end local v1    # "loggerFactoryClassLoader":Ljava/lang/ClassLoader;
    .end local v2    # "path":Ljava/net/URL;
    .end local v3    # "paths":Ljava/util/Enumeration;
    :catch_23
    move-exception v0

    .line 235
    .local v0, "ioe":Ljava/io/IOException;
    const-string v5, "Error getting resources from path"

    invoke-static {v5, v0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 237
    .end local v0    # "ioe":Ljava/io/IOException;
    :cond_29
    return-object v4

    .line 227
    .restart local v1    # "loggerFactoryClassLoader":Ljava/lang/ClassLoader;
    :cond_2a
    :try_start_2a
    sget-object v5, Lorg/slf4j/LoggerFactory;->STATIC_LOGGER_BINDER_PATH:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/ClassLoader;->getResources(Ljava/lang/String;)Ljava/util/Enumeration;
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_2a .. :try_end_2f} :catch_23

    move-result-object v3

    .restart local v3    # "paths":Ljava/util/Enumeration;
    goto :goto_13
.end method

.method private static final fixSubstitutedLoggers()V
    .registers 4

    .prologue
    .line 166
    sget-object v3, Lorg/slf4j/LoggerFactory;->TEMP_FACTORY:Lorg/slf4j/helpers/SubstituteLoggerFactory;

    invoke-virtual {v3}, Lorg/slf4j/helpers/SubstituteLoggerFactory;->getLoggers()Ljava/util/List;

    move-result-object v1

    .line 168
    .local v1, "loggers":Ljava/util/List;, "Ljava/util/List<Lorg/slf4j/helpers/SubstituteLogger;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 183
    :goto_c
    return-void

    .line 172
    :cond_d
    const-string v3, "The following set of substitute loggers may have been accessed"

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 173
    const-string v3, "during the initialization phase. Logging calls during this"

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 174
    const-string v3, "phase were not honored. However, subsequent logging calls to these"

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 175
    const-string v3, "loggers will work as normally expected."

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 176
    const-string v3, "See also http://www.slf4j.org/codes.html#substituteLogger"

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 177
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_2a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_49

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/slf4j/helpers/SubstituteLogger;

    .line 178
    .local v2, "subLogger":Lorg/slf4j/helpers/SubstituteLogger;
    invoke-virtual {v2}, Lorg/slf4j/helpers/SubstituteLogger;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/slf4j/helpers/SubstituteLogger;->setDelegate(Lorg/slf4j/Logger;)V

    .line 179
    invoke-virtual {v2}, Lorg/slf4j/helpers/SubstituteLogger;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    goto :goto_2a

    .line 182
    .end local v2    # "subLogger":Lorg/slf4j/helpers/SubstituteLogger;
    :cond_49
    sget-object v3, Lorg/slf4j/LoggerFactory;->TEMP_FACTORY:Lorg/slf4j/helpers/SubstituteLoggerFactory;

    invoke-virtual {v3}, Lorg/slf4j/helpers/SubstituteLoggerFactory;->clear()V

    goto :goto_c
.end method

.method public static getILoggerFactory()Lorg/slf4j/ILoggerFactory;
    .registers 2

    .prologue
    .line 300
    sget v0, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    if-nez v0, :cond_a

    .line 301
    const/4 v0, 0x1

    sput v0, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 302
    invoke-static {}, Lorg/slf4j/LoggerFactory;->performInitialization()V

    .line 304
    :cond_a
    sget v0, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    packed-switch v0, :pswitch_data_2e

    .line 316
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Unreachable code"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 306
    :pswitch_17
    invoke-static {}, Lorg/slf4j/impl/StaticLoggerBinder;->getSingleton()Lorg/slf4j/impl/StaticLoggerBinder;

    move-result-object v0

    invoke-virtual {v0}, Lorg/slf4j/impl/StaticLoggerBinder;->getLoggerFactory()Lorg/slf4j/ILoggerFactory;

    move-result-object v0

    .line 314
    :goto_1f
    return-object v0

    .line 308
    :pswitch_20
    sget-object v0, Lorg/slf4j/LoggerFactory;->NOP_FALLBACK_FACTORY:Lorg/slf4j/helpers/NOPLoggerFactory;

    goto :goto_1f

    .line 310
    :pswitch_23
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "org.slf4j.LoggerFactory could not be successfully initialized. See also http://www.slf4j.org/codes.html#unsuccessfulInit"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 314
    :pswitch_2b
    sget-object v0, Lorg/slf4j/LoggerFactory;->TEMP_FACTORY:Lorg/slf4j/helpers/SubstituteLoggerFactory;

    goto :goto_1f

    .line 304
    :pswitch_data_2e
    .packed-switch 0x1
        :pswitch_2b
        :pswitch_23
        :pswitch_17
        :pswitch_20
    .end packed-switch
.end method

.method public static getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;
    .registers 2
    .param p0, "clazz"    # Ljava/lang/Class;

    .prologue
    .line 288
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    return-object v0
.end method

.method public static getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;
    .registers 3
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 276
    invoke-static {}, Lorg/slf4j/LoggerFactory;->getILoggerFactory()Lorg/slf4j/ILoggerFactory;

    move-result-object v0

    .line 277
    .local v0, "iLoggerFactory":Lorg/slf4j/ILoggerFactory;
    invoke-interface {v0, p0}, Lorg/slf4j/ILoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v1

    return-object v1
.end method

.method private static isAmbiguousStaticLoggerBinderPathSet(Ljava/util/Set;)Z
    .registers 3
    .param p0, "staticLoggerBinderPathSet"    # Ljava/util/Set;

    .prologue
    const/4 v0, 0x1

    .line 241
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v1

    if-le v1, v0, :cond_8

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method private static messageContainsOrgSlf4jImplStaticLoggerBinder(Ljava/lang/String;)Z
    .registers 5
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    const/4 v3, -0x1

    .line 115
    if-nez p0, :cond_6

    .line 121
    :cond_5
    :goto_5
    return v0

    .line 117
    :cond_6
    const-string v2, "org/slf4j/impl/StaticLoggerBinder"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_10

    move v0, v1

    .line 118
    goto :goto_5

    .line 119
    :cond_10
    const-string v2, "org.slf4j.impl.StaticLoggerBinder"

    invoke-virtual {p0, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-eq v2, v3, :cond_5

    move v0, v1

    .line 120
    goto :goto_5
.end method

.method private static final performInitialization()V
    .registers 2

    .prologue
    .line 108
    invoke-static {}, Lorg/slf4j/LoggerFactory;->bind()V

    .line 109
    sget v0, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_b

    .line 110
    invoke-static {}, Lorg/slf4j/LoggerFactory;->versionSanityCheck()V

    .line 112
    :cond_b
    return-void
.end method

.method private static reportActualBinding(Ljava/util/Set;)V
    .registers 3
    .param p0, "staticLoggerBinderPathSet"    # Ljava/util/Set;

    .prologue
    .line 262
    invoke-static {p0}, Lorg/slf4j/LoggerFactory;->isAmbiguousStaticLoggerBinderPathSet(Ljava/util/Set;)Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Actual binding is of type ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lorg/slf4j/impl/StaticLoggerBinder;->getSingleton()Lorg/slf4j/impl/StaticLoggerBinder;

    move-result-object v1

    invoke-virtual {v1}, Lorg/slf4j/impl/StaticLoggerBinder;->getLoggerFactoryClassStr()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 265
    :cond_2a
    return-void
.end method

.method private static reportMultipleBindingAmbiguity(Ljava/util/Set;)V
    .registers 5
    .param p0, "staticLoggerBinderPathSet"    # Ljava/util/Set;

    .prologue
    .line 250
    invoke-static {p0}, Lorg/slf4j/LoggerFactory;->isAmbiguousStaticLoggerBinderPathSet(Ljava/util/Set;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 251
    const-string v2, "Class path contains multiple SLF4J bindings."

    invoke-static {v2}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 252
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 253
    .local v0, "iterator":Ljava/util/Iterator;
    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 254
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/URL;

    .line 255
    .local v1, "path":Ljava/net/URL;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Found binding in ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    goto :goto_f

    .line 257
    .end local v1    # "path":Ljava/net/URL;
    :cond_38
    const-string v2, "See http://www.slf4j.org/codes.html#multiple_bindings for an explanation."

    invoke-static {v2}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 259
    .end local v0    # "iterator":Ljava/util/Iterator;
    :cond_3d
    return-void
.end method

.method static reset()V
    .registers 1

    .prologue
    .line 103
    const/4 v0, 0x0

    sput v0, Lorg/slf4j/LoggerFactory;->INITIALIZATION_STATE:I

    .line 104
    new-instance v0, Lorg/slf4j/helpers/SubstituteLoggerFactory;

    invoke-direct {v0}, Lorg/slf4j/helpers/SubstituteLoggerFactory;-><init>()V

    sput-object v0, Lorg/slf4j/LoggerFactory;->TEMP_FACTORY:Lorg/slf4j/helpers/SubstituteLoggerFactory;

    .line 105
    return-void
.end method

.method private static final versionSanityCheck()V
    .registers 6

    .prologue
    .line 187
    :try_start_0
    sget-object v3, Lorg/slf4j/impl/StaticLoggerBinder;->REQUESTED_API_VERSION:Ljava/lang/String;

    .line 189
    .local v3, "requested":Ljava/lang/String;
    const/4 v2, 0x0

    .line 190
    .local v2, "match":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_4
    sget-object v4, Lorg/slf4j/LoggerFactory;->API_COMPATIBILITY_LIST:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_17

    .line 191
    sget-object v4, Lorg/slf4j/LoggerFactory;->API_COMPATIBILITY_LIST:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_14

    .line 192
    const/4 v2, 0x1

    .line 190
    :cond_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 195
    :cond_17
    if-nez v2, :cond_48

    .line 196
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "The requested version "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " by your slf4j binding is not compatible with "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lorg/slf4j/LoggerFactory;->API_COMPATIBILITY_LIST:[Ljava/lang/String;

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V

    .line 199
    const-string v4, "See http://www.slf4j.org/codes.html#version_mismatch for further details."

    invoke-static {v4}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;)V
    :try_end_48
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_48} :catch_50
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_48} :catch_49

    .line 210
    :cond_48
    :goto_48
    return-void

    .line 206
    :catch_49
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Throwable;
    const-string v4, "Unexpected problem occured during version sanity check"

    invoke-static {v4, v0}, Lorg/slf4j/helpers/Util;->report(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_48

    .line 201
    .end local v0    # "e":Ljava/lang/Throwable;
    :catch_50
    move-exception v4

    goto :goto_48
.end method
