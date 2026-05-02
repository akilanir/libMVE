package com.bumptech.glide.manager;

import com.bumptech.glide.RequestManager;
import java.util.Collections;
import java.util.Set;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/manager/EmptyRequestManagerTreeNode.class */
final class EmptyRequestManagerTreeNode implements RequestManagerTreeNode {
    EmptyRequestManagerTreeNode() {
    }

    @Override // com.bumptech.glide.manager.RequestManagerTreeNode
    public Set<RequestManager> getDescendants() {
        return Collections.emptySet();
    }
}
