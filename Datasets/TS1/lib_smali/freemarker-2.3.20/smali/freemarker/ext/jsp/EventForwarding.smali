.class public Lfreemarker/ext/jsp/EventForwarding;
.super Ljava/lang/Object;
.source "EventForwarding.java"

# interfaces
.implements Ljavax/servlet/ServletContextAttributeListener;
.implements Ljavax/servlet/ServletContextListener;
.implements Ljavax/servlet/http/HttpSessionListener;
.implements Ljavax/servlet/http/HttpSessionAttributeListener;


# static fields
.field private static final ATTR_NAME:Ljava/lang/String;

.field static class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

.field private static final logger:Lfreemarker/log/Logger;


# instance fields
.field private final httpSessionAttributeListeners:Ljava/util/List;

.field private final httpSessionListeners:Ljava/util/List;

.field private final servletContextAttributeListeners:Ljava/util/List;

.field private final servletContextListeners:Ljava/util/List;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 85
    const-string v0, "freemarker.jsp"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/EventForwarding;->logger:Lfreemarker/log/Logger;

    .line 87
    sget-object v0, Lfreemarker/ext/jsp/EventForwarding;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    if-nez v0, :cond_1b

    const-string v0, "freemarker.ext.jsp.EventForwarding"

    invoke-static {v0}, Lfreemarker/ext/jsp/EventForwarding;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/EventForwarding;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    :goto_14
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lfreemarker/ext/jsp/EventForwarding;->ATTR_NAME:Ljava/lang/String;

    return-void

    :cond_1b
    sget-object v0, Lfreemarker/ext/jsp/EventForwarding;->class$freemarker$ext$jsp$EventForwarding:Ljava/lang/Class;

    goto :goto_14
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    .line 91
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    .line 92
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    return-void
.end method

.method private addListener(Ljava/util/EventListener;)V
    .registers 6
    .param p1, "listener"    # Ljava/util/EventListener;

    .prologue
    .line 104
    const/4 v0, 0x0

    .line 105
    .local v0, "added":Z
    instance-of v1, p1, Ljavax/servlet/ServletContextAttributeListener;

    if-eqz v1, :cond_b

    .line 107
    iget-object v1, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-direct {p0, v1, p1}, Lfreemarker/ext/jsp/EventForwarding;->addListener(Ljava/util/List;Ljava/util/EventListener;)V

    .line 108
    const/4 v0, 0x1

    .line 110
    :cond_b
    instance-of v1, p1, Ljavax/servlet/ServletContextListener;

    if-eqz v1, :cond_15

    .line 112
    iget-object v1, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    invoke-direct {p0, v1, p1}, Lfreemarker/ext/jsp/EventForwarding;->addListener(Ljava/util/List;Ljava/util/EventListener;)V

    .line 113
    const/4 v0, 0x1

    .line 115
    :cond_15
    instance-of v1, p1, Ljavax/servlet/http/HttpSessionAttributeListener;

    if-eqz v1, :cond_1f

    .line 117
    iget-object v1, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-direct {p0, v1, p1}, Lfreemarker/ext/jsp/EventForwarding;->addListener(Ljava/util/List;Ljava/util/EventListener;)V

    .line 118
    const/4 v0, 0x1

    .line 120
    :cond_1f
    instance-of v1, p1, Ljavax/servlet/http/HttpSessionListener;

    if-eqz v1, :cond_29

    .line 122
    iget-object v1, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    invoke-direct {p0, v1, p1}, Lfreemarker/ext/jsp/EventForwarding;->addListener(Ljava/util/List;Ljava/util/EventListener;)V

    .line 123
    const/4 v0, 0x1

    .line 125
    :cond_29
    if-nez v0, :cond_57

    .line 126
    sget-object v1, Lfreemarker/ext/jsp/EventForwarding;->logger:Lfreemarker/log/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Listener of class "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "wasn\'t registered as it doesn\'t implement any of the "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, "recognized listener interfaces."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lfreemarker/log/Logger;->warn(Ljava/lang/String;)V

    .line 131
    :cond_57
    return-void
.end method

.method private addListener(Ljava/util/List;Ljava/util/EventListener;)V
    .registers 4
    .param p1, "listeners"    # Ljava/util/List;
    .param p2, "listener"    # Ljava/util/EventListener;

    .prologue
    .line 139
    monitor-enter p1

    .line 141
    :try_start_1
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    monitor-exit p1

    .line 143
    return-void

    .line 142
    :catchall_6
    move-exception v0

    monitor-exit p1
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_6

    throw v0
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 87
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method static getInstance(Ljavax/servlet/ServletContext;)Lfreemarker/ext/jsp/EventForwarding;
    .registers 2
    .param p0, "context"    # Ljavax/servlet/ServletContext;

    .prologue
    .line 135
    sget-object v0, Lfreemarker/ext/jsp/EventForwarding;->ATTR_NAME:Ljava/lang/String;

    invoke-interface {p0, v0}, Ljavax/servlet/ServletContext;->getAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/ext/jsp/EventForwarding;

    return-object v0
.end method


# virtual methods
.method addListeners(Ljava/util/List;)V
    .registers 4
    .param p1, "listeners"    # Ljava/util/List;

    .prologue
    .line 96
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 98
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/EventListener;

    invoke-direct {p0, v1}, Lfreemarker/ext/jsp/EventForwarding;->addListener(Ljava/util/EventListener;)V

    goto :goto_4

    .line 100
    :cond_14
    return-void
.end method

.method public attributeAdded(Ljavax/servlet/ServletContextAttributeEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/ServletContextAttributeEvent;

    .prologue
    .line 147
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    monitor-enter v3

    .line 149
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 150
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 152
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/ServletContextAttributeListener;

    invoke-interface {v2, p1}, Ljavax/servlet/ServletContextAttributeListener;->attributeAdded(Ljavax/servlet/ServletContextAttributeEvent;)V

    .line 150
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 154
    :cond_1a
    monitor-exit v3

    .line 155
    return-void

    .line 154
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public attributeAdded(Ljavax/servlet/http/HttpSessionBindingEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/http/HttpSessionBindingEvent;

    .prologue
    .line 233
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    monitor-enter v3

    .line 235
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 236
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 238
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/http/HttpSessionAttributeListener;

    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSessionAttributeListener;->attributeAdded(Ljavax/servlet/http/HttpSessionBindingEvent;)V

    .line 236
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 240
    :cond_1a
    monitor-exit v3

    .line 241
    return-void

    .line 240
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public attributeRemoved(Ljavax/servlet/ServletContextAttributeEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/ServletContextAttributeEvent;

    .prologue
    .line 159
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    monitor-enter v3

    .line 161
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 162
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 164
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/ServletContextAttributeListener;

    invoke-interface {v2, p1}, Ljavax/servlet/ServletContextAttributeListener;->attributeRemoved(Ljavax/servlet/ServletContextAttributeEvent;)V

    .line 162
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 166
    :cond_1a
    monitor-exit v3

    .line 167
    return-void

    .line 166
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public attributeRemoved(Ljavax/servlet/http/HttpSessionBindingEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/http/HttpSessionBindingEvent;

    .prologue
    .line 245
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    monitor-enter v3

    .line 247
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 248
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 250
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/http/HttpSessionAttributeListener;

    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSessionAttributeListener;->attributeRemoved(Ljavax/servlet/http/HttpSessionBindingEvent;)V

    .line 248
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 252
    :cond_1a
    monitor-exit v3

    .line 253
    return-void

    .line 252
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public attributeReplaced(Ljavax/servlet/ServletContextAttributeEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/ServletContextAttributeEvent;

    .prologue
    .line 171
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    monitor-enter v3

    .line 173
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 174
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 176
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextAttributeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/ServletContextAttributeListener;

    invoke-interface {v2, p1}, Ljavax/servlet/ServletContextAttributeListener;->attributeReplaced(Ljavax/servlet/ServletContextAttributeEvent;)V

    .line 174
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 178
    :cond_1a
    monitor-exit v3

    .line 179
    return-void

    .line 178
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public attributeReplaced(Ljavax/servlet/http/HttpSessionBindingEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/http/HttpSessionBindingEvent;

    .prologue
    .line 257
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    monitor-enter v3

    .line 259
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 260
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 262
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionAttributeListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/http/HttpSessionAttributeListener;

    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSessionAttributeListener;->attributeReplaced(Ljavax/servlet/http/HttpSessionBindingEvent;)V

    .line 260
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 264
    :cond_1a
    monitor-exit v3

    .line 265
    return-void

    .line 264
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public contextDestroyed(Ljavax/servlet/ServletContextEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/ServletContextEvent;

    .prologue
    .line 197
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    monitor-enter v3

    .line 199
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 200
    .local v1, "s":I
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1b

    .line 202
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/ServletContextListener;

    invoke-interface {v2, p1}, Ljavax/servlet/ServletContextListener;->contextDestroyed(Ljavax/servlet/ServletContextEvent;)V

    .line 200
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 204
    :cond_1b
    monitor-exit v3

    .line 205
    return-void

    .line 204
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v2
.end method

.method public contextInitialized(Ljavax/servlet/ServletContextEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/ServletContextEvent;

    .prologue
    .line 183
    invoke-virtual {p1}, Ljavax/servlet/ServletContextEvent;->getServletContext()Ljavax/servlet/ServletContext;

    move-result-object v2

    sget-object v3, Lfreemarker/ext/jsp/EventForwarding;->ATTR_NAME:Ljava/lang/String;

    invoke-interface {v2, v3, p0}, Ljavax/servlet/ServletContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 185
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    monitor-enter v3

    .line 187
    :try_start_c
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 188
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_13
    if-ge v0, v1, :cond_23

    .line 190
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->servletContextListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/ServletContextListener;

    invoke-interface {v2, p1}, Ljavax/servlet/ServletContextListener;->contextInitialized(Ljavax/servlet/ServletContextEvent;)V

    .line 188
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 192
    :cond_23
    monitor-exit v3

    .line 193
    return-void

    .line 192
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_25
    move-exception v2

    monitor-exit v3
    :try_end_27
    .catchall {:try_start_c .. :try_end_27} :catchall_25

    throw v2
.end method

.method public sessionCreated(Ljavax/servlet/http/HttpSessionEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/http/HttpSessionEvent;

    .prologue
    .line 209
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    monitor-enter v3

    .line 211
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 212
    .local v1, "s":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a
    if-ge v0, v1, :cond_1a

    .line 214
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/http/HttpSessionListener;

    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSessionListener;->sessionCreated(Ljavax/servlet/http/HttpSessionEvent;)V

    .line 212
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 216
    :cond_1a
    monitor-exit v3

    .line 217
    return-void

    .line 216
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1c
    move-exception v2

    monitor-exit v3
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw v2
.end method

.method public sessionDestroyed(Ljavax/servlet/http/HttpSessionEvent;)V
    .registers 6
    .param p1, "arg0"    # Ljavax/servlet/http/HttpSessionEvent;

    .prologue
    .line 221
    iget-object v3, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    monitor-enter v3

    .line 223
    :try_start_3
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    .line 224
    .local v1, "s":I
    add-int/lit8 v0, v1, -0x1

    .local v0, "i":I
    :goto_b
    if-ltz v0, :cond_1b

    .line 226
    iget-object v2, p0, Lfreemarker/ext/jsp/EventForwarding;->httpSessionListeners:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/servlet/http/HttpSessionListener;

    invoke-interface {v2, p1}, Ljavax/servlet/http/HttpSessionListener;->sessionDestroyed(Ljavax/servlet/http/HttpSessionEvent;)V

    .line 224
    add-int/lit8 v0, v0, -0x1

    goto :goto_b

    .line 228
    :cond_1b
    monitor-exit v3

    .line 229
    return-void

    .line 228
    .end local v0    # "i":I
    .end local v1    # "s":I
    :catchall_1d
    move-exception v2

    monitor-exit v3
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v2
.end method
