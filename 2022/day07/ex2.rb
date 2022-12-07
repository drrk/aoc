require 'tree'

root_node = Tree::TreeNode.new('/')
current_node = root_node

f = File.open('input.txt')
line = f.readline.chomp
while line != '' do
    lineparts = line.split(' ')
    if lineparts[0] == '$'
        # Command
        if lineparts[1] == 'cd'
            # Move Directory
            if lineparts[2] == '/'
                current_node = root_node
            elsif lineparts[2] == '..'
                # move to parent
                current_node = current_node.parent
            else
                # Try to descend into the directory
                node = current_node[lineparts[2]]
                if node == nil
                    # create it if it doesn't exist
                    node = Tree::TreeNode.new(lineparts[2])
                    current_node << node
                end
                current_node = node
            end
            # read in next line
            line = f.readline.chomp
        elsif lineparts[1] == 'ls'
            # List Directory

            # read in next line
            line = f.readline.chomp
            lineparts = line.split(' ')
            while line != '' && lineparts[0] != '$'   
                if lineparts[0] == 'dir'
                    # add the directory node
                    node = Tree::TreeNode.new(lineparts[1])
                    current_node << node
                else
                    # Add a file node, with size
                    node = Tree::TreeNode.new(lineparts[1], lineparts[0].to_i)
                    current_node << node
                end
                # read in next line
                line = f.readline.chomp
                lineparts = line.split(' ')
            end
        end
    else
        # This should not happen log it
        print "Error, non command at start of section: #{line}\n\n"
    end
end

total_used = 0
root_node.each_leaf do |leaf|
    total_used += leaf.content
end
space_available = 70000000 - total_used
space_needed = 30000000 - space_available

candidate=total_used
root_node.each do |node|
    if node.children?
        size = 0
        node.each_leaf do |leaf|
            size += leaf.content
        end
        if size < candidate && size > space_needed
            candidate = size
        end
    end
end

print "#{candidate}\n"