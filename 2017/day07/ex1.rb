require 'rubytree'
root=nil
spares = Array.new
File.readlines('input.txt').each do |line|
  s_line = line.split(/\s/)
  name = s_line[0]
  weight = s_line[1].match(/([0-9]+)/)[0].to_i
  children = nil
  if s_line.length > 2
    children = s_line.drop(3).join.split(',')
  end
  print "name: #{name}\nweight: #{weight}\n"
  
  # See if we exist on the tree already
  node = nil
  unless root == nil
    root.bredth_each do |n| 
      if n.name == name
        node = n
        break
      end 
    end
  end
  # See if we are in the spares
  index = spares.index { |x| x.name == name }
  if index != nil
    node = spares[index]
    spares.slice!(index)
  end 
  
  node = Tree::TreeNode.new(name) if node == nil
  node.content = weight
  
  unless children == nil 
    children.each do |child|
    node << Tree::TreeNode.new(child)
  end
  root = node if root == nil
end
