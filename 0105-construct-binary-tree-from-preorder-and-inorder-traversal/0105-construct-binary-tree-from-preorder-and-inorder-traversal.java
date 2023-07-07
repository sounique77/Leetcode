/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode() {}
 *     TreeNode(int val) { this.val = val; }
 *     TreeNode(int val, TreeNode left, TreeNode right) {
 *         this.val = val;
 *         this.left = left;
 *         this.right = right;
 *     }
 * }
 */
class Solution {
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        Map<Integer, Integer> map = new HashMap<>();
        for (int i = 0; i < inorder.length; i++) {
            map.put(inorder[i], i);
        }
        
        Stack<Triple> stack = new Stack<>();
        int index = 0;
        TreeNode node = new TreeNode();
        stack.push(new Triple(0, preorder.length - 1, node));
        
        while (!stack.isEmpty()) {
            Triple triple = stack.pop();
            int low = triple.low;
            int high = triple.high;
            TreeNode currNode = triple.node;
            
            int rootIndex = map.get(preorder[index]);
            currNode.val = preorder[index];
            index++;
            
            if (rootIndex + 1 <= high) {
                currNode.right = new TreeNode();
                stack.push(new Triple(rootIndex + 1, high, currNode.right));
            }
            
            if (low <= rootIndex - 1) {
                currNode.left = new TreeNode();
                stack.push(new Triple(low, rootIndex - 1, currNode.left));
            }
        }
        
        return node;
    }
    
    private static class Triple {
        int low;
        int high;
        TreeNode node;
        
        public Triple(int low, int high, TreeNode node) {
            this.low = low;
            this.high = high;
            this.node = node;
        }
    }
}
